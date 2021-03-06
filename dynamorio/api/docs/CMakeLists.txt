# **********************************************************
# Copyright (c) 2010-2012 Google, Inc.    All rights reserved.
# Copyright (c) 2009-2010 VMware, Inc.    All rights reserved.
# **********************************************************

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# * Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
# 
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# 
# * Neither the name of VMware, Inc. nor the names of its contributors may be
#   used to endorse or promote products derived from this software without
#   specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL VMWARE, INC. OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
# DAMAGE.

# top-level CMakeLists.txt finds the packages we need

file(GLOB figures_fig *.fig)

set(genimg_dirname ${CMAKE_CURRENT_BINARY_DIR}/genimages)
file(MAKE_DIRECTORY ${genimg_dirname})

if (WIN32 AND "${ImageMagick_mogrify_EXECUTABLE}" MATCHES "cygwin")
  # i#100: cygwin mogrify mis-parses mixed paths when the drive is a,
  # b, c, or g (haven't tracked down why those particular letters):
  #   % mogrify -resize 33% -format png c:/client.tiff[0]
  #   mogrify: Must specify image size `/client.tiff'.
  find_program(CYGPATH cygpath) # XXX: should share w/ Cmake_doxyfile.cmake
  if (NOT CYGPATH)
    message(FATAL_ERROR "cannot find cygpath: thus cannot use cygwin ImageMagick")
  endif (NOT CYGPATH)
  execute_process(COMMAND
    ${CYGPATH} -u "${genimg_dirname}"
    RESULT_VARIABLE cygpath_result
    ERROR_VARIABLE cygpath_err
    OUTPUT_VARIABLE genimg_dirname_IM
    )
  if (cygpath_result OR cygpath_err)
    message(FATAL_ERROR "*** ${CYGPATH} failed: ***\n${cygpath_err}")
  endif (cygpath_result OR cygpath_err)
  string(REGEX REPLACE "[\r\n]" "" genimg_dirname_IM "${genimg_dirname_IM}")
else (WIN32 AND "${ImageMagick_mogrify_EXECUTABLE}" MATCHES "cygwin")
  set(genimg_dirname_IM "${genimg_dirname}")
endif (WIN32 AND "${ImageMagick_mogrify_EXECUTABLE}" MATCHES "cygwin")

# Because fig2dev does not perform anti-aliasing, converting directly
# to an image format can result in very poor quality lines and text.
# This problem is compounded if that image is subsequently resized
# without any anti-aliasing, such as by your web browser.  The
# solution is to magnify the vector data to at least 4x and then
# generate a lossless bitmap format such as TIFF; then have a real
# image manipulator resize it to the final size (cannot make
# browser-resizable vector graphics).
# See also http://www.burningcutlery.com/derek/bargraph/
foreach (fig ${figures_fig})
  get_filename_component(base ${fig} NAME_WE)
  add_custom_command(
    OUTPUT ${genimg_dirname}/${base}.eps
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${base}.fig
    # fig2dev doesn't quote gs output path; set working dir to avoid spaces
    COMMAND ${FIG2DEV_EXECUTABLE}
    ARGS -L eps ${CMAKE_CURRENT_SOURCE_DIR}/${base}.fig ${base}.eps
    WORKING_DIRECTORY ${genimg_dirname}
    VERBATIM # recommended: p260
    )
  # To avoid keeping the intermediate .tiff files around, which are quite
  # large (50MB total, nearly half the space in a default build dir), we
  # do not list as a separate custom command target but build inside
  # a sequence of commands:
  add_custom_command(
    OUTPUT ${genimg_dirname}/${base}.png
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${base}.fig
    # First build a tiff
    COMMAND ${FIG2DEV_EXECUTABLE}
      ARGS -L tiff -m 4 ${CMAKE_CURRENT_SOURCE_DIR}/${base}.fig ${base}.tiff
    # Second, build a png from the tiff
    COMMAND ${ImageMagick_mogrify_EXECUTABLE}
      # fig2dev produces multi-part image so ask for just 1st
      ARGS -resize 33% -format png ${genimg_dirname_IM}/${base}.tiff[0]
    # Third, delete the tiff
    COMMAND ${CMAKE_COMMAND}
      ARGS -E remove ${genimg_dirname}/${base}.tiff
    # fig2dev doesn't quote gs output path; set working dir to avoid spaces
    WORKING_DIRECTORY ${genimg_dirname}
    VERBATIM # recommended: p260
    )
  # FYI: for VMSAFE we did: $(SED) 's|DynamoRIO|${VMSAFE_NAME}|g'
  set(figures_png ${figures_png} ${genimg_dirname}/${base}.png)
  set(figures_eps ${figures_eps} ${genimg_dirname}/${base}.eps)
endforeach (fig)

function (gendox_to_dox gendox_in gendox_out path)
  file(GLOB dox_files "${path}/*.dox")
  foreach (dox_file ${dox_files})
    file(READ "${dox_file}" dox_string)
    string(REGEX MATCHALL "\n\\\\page [^ ]+" page "${dox_string}")
    set(dox_pages ${dox_pages} ${page})
  endforeach (dox_file)
  foreach (page ${dox_pages})
    string(REGEX REPLACE "\n\\\\page " "" pgname "${page}")
    set(dox_gen_toc "${dox_gen_toc}- \\\\subpage ${pgname}\n")
  endforeach (page)
  file(READ "${CMAKE_CURRENT_SOURCE_DIR}/${gendox_in}.gendox" gendox)
  string(REGEX REPLACE REPLACE_WITH_GENDOX_SUBPAGES "${dox_gen_toc}" gendox "${gendox}")
  file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/${gendox_out}.dox" "${gendox}")
endfunction (gendox_to_dox)

# we want docs for Extensions (i#277/PR 540817) to be subpages but we
# don't want to edit a top-level page to add new ones so we generate it
gendox_to_dox("ext" "ext_gendox" "${PROJECT_SOURCE_DIR}/ext/*/")
gendox_to_dox("tool" "tool_gendox" "${PROJECT_SOURCE_DIR}/clients/*/")

# determine doxygen version
include(CMake_doxyutils.cmake)
check_doxygen_version(${DOXYGEN_EXECUTABLE} "${DOXYGEN_VERSION}" doxygen_ver)

set(doxyfile ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)
add_custom_command(
  OUTPUT ${doxyfile}
  DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/API.doxy
          ${CMAKE_CURRENT_SOURCE_DIR}/CMake_doxyfile.cmake
  COMMAND ${CMAKE_COMMAND}
  # script does not inherit any vars so we must pass them all in
  # to work around i#84 be sure to put a space after -D for 1st arg at least
  ARGS -D srcdir=${CMAKE_CURRENT_SOURCE_DIR} -Doutfile=${doxyfile}
       -Dproj_srcdir=${PROJECT_SOURCE_DIR} -Dversion_number=${VERSION_NUMBER}
       -Dheader_dir=${BUILD_INCLUDE} -Dgendox_dir=${CMAKE_CURRENT_BINARY_DIR}
       -DDOXYGEN_EXECUTABLE=${DOXYGEN_EXECUTABLE}
       -Ddoxygen_ver=${doxygen_ver}
       -P ${CMAKE_CURRENT_SOURCE_DIR}/CMake_doxyfile.cmake
  VERBATIM # recommended: p260
  )

set(docsgen ${CMAKE_CURRENT_BINARY_DIR}/html/index.html)

file(GLOB dox_files *.dox)
# we depend on the samples even though we don't copy them,
# to have them as dependencies for the install rules
file(GLOB samples_files ../samples/*.c ../samples/Makefile)
file(GLOB header_files  ${BUILD_INCLUDE}/*.h)
add_custom_command(
  OUTPUT ${docsgen} # among other files
  DEPENDS ${dox_files}
          ${ext_dox_files}
          ${tool_dox_files}
          ${header_files}
          ${doxyfile}
          ${figures_eps}
          ${figures_png}
          ${CMAKE_CURRENT_SOURCE_DIR}/CMake_rundoxygen.cmake
          ${samples_files}
  # We want doxygen to fail if it has warnings like "can't find header
  # files" so we run it through a script
  COMMAND ${CMAKE_COMMAND}
  # Have to quote dox_files to keep ;-separated
  # to work around i#84 be sure to put a space after -D for 1st arg at least
  ARGS -D DOXYGEN_EXECUTABLE=${DOXYGEN_EXECUTABLE}
       -Ddoxygen_ver=${doxygen_ver}
       -Dversion_number=${VERSION_NUMBER}
       -Dmodule_string_long="DynamoRIO Extension Details"
       -Dmodule_string_short="Extension"
       -Dhome_url="http://www.dynamorio.org"
       -Dhome_title="DynamoRIO Home Page"
       -Dlogo_imgfile="drlogo.png"
       -P ${CMAKE_CURRENT_SOURCE_DIR}/CMake_rundoxygen.cmake
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  VERBATIM # recommended: p260
  )
set_directory_properties(PROPERTIES
  ADDITIONAL_MAKE_CLEAN_FILES "html;latex;rtf")

add_custom_target(htmldocs ALL
  DEPENDS ${doxyfile}
          ${figures_eps}
          ${figures_png}
          ${docsgen}
  )
# add_custom_target DEPENDS cannot take targets!
add_dependencies(htmldocs api_headers)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/images/favicon.png
  ${CMAKE_CURRENT_BINARY_DIR}/html/favicon.png
  COPYONLY)

# FIXME i#59: if epstopdf and latex are available, add optional pdf
# target that invokes fix-latex.pl and install rule.
# Need to copy drlogo-16x16.png to latex/drlogo.png after i#80 changes.

###########################################################################
# install rules

DR_install(DIRECTORY
  ${CMAKE_CURRENT_BINARY_DIR}/html
  DESTINATION ${INSTALL_DOCS}
  )

# IE for some reason won't initially load an .ico in a web page from a server,
# though will show it via file: or after pointing straight at image from server.
# doxygen fails to copy image referenced only in footer.html
DR_install(FILES
  ${CMAKE_CURRENT_SOURCE_DIR}/images/favicon.png
  DESTINATION ${INSTALL_DOCS}/html
  )

