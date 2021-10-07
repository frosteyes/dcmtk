#!/bin/bash

# CMake config for static setup to cross compile

pushd /home/clst/Git/github/frosteyes/dcmtk || exit
#pushd /home/frosteyes/Golf/FrostEyes/Git/Github/frosteyes/dcmtk || exit

mkdir build

pushd ./build || exit

# Test of static cmake setup

# -DCMAKE_SYSTEM_NAME:STRING=Linux enables CMAKE_CROSSCOMPILING
# See https://cmake.org/cmake/help/latest/variable/CMAKE_CROSSCOMPILING.html

# Basic for cross compilation
DCMTK_BASIC_CROSS="-DCMAKE_SYSTEM_NAME:STRING=Linux \
                   -DDCMTK_NO_TRY_RUN:BOOL=1 \
                   -DC_CHAR_UNSIGNED:BOOL=0 \
                   -DDCMTK_ICONV_FLAGS_ANALYZED:BOOL=TRUE \
                   -DDCMTK_FIXED_ICONV_CONVERSION_FLAGS:STRING=AbortTranscodingOnIllegalSequence \
                   -DDCMTK_STDLIBC_ICONV_HAS_DEFAULT_ENCODING:BOOL=TRUE \
                  "

# Setup for STL / CXX and cross compilation for gcc 9.3 on my Ubuntu 20.04
DCMTK_STL_CROSS="-DDCMTK_ENABLE_STL:BOOL=ON \
                 -DHAVE_STL_VECTOR_TEST_RESULT:BOOL=OFF \
                 -DHAVE_STL_ALGORITHM_TEST_RESULT:BOOL=OFF \
                 -DHAVE_STL_LIMITS_TEST_RESULT:BOOL=OFF \
                 -DHAVE_STL_LIST_TEST_RESULT:BOOL=OFF \
                 -DHAVE_STL_MAP_TEST_RESULT:BOOL=OFF \
                 -DHAVE_STL_MEMORY_TEST_RESULT:BOOL=OFF \
                 -DHAVE_STL_STACK_TEST_RESULT:BOOL=OFF \
                 -DHAVE_STL_STRING_TEST_RESULT:BOOL=OFF \
                 -DHAVE_STL_TYPE_TRAITS_TEST_RESULT:BOOL=OFF \
                 -DHAVE_STL_TUPLE_TEST_RESULT:BOOL=OFF \
                 -DHAVE_STL_SYSTEM_ERROR_TEST_RESULT:BOOL=OFF \
                 -DDCMTK_ENABLE_CXX11:BOOL=ON \
                "

cmake ${DCMTK_BASIC_CROSS} \
      ${DCMTK_STL_CROSS} \
      ..

popd || exit

popd ||exit
