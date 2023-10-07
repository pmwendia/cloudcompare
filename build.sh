#!/bin/bash

# This script automates the build process for your project on your local PC.

# Command to build on Ubuntu
# function ubuntu_build() {
#     echo "Building for Ubuntu $1 SCALAR_DOUBLE=$2"

#     # sudo apt-get update -qq

#     # sudo apt-get install -qy cmake ninja-build \
#     #     libqt5svg5-dev libqt5opengl5-dev qttools5-dev qttools5-dev-tools libqt5websockets5-dev \
#     #     libtbb-dev \
#     #     libavcodec-dev libavformat-dev libavutil-dev libswscale-dev \
#     #     libboost-program-options-dev libboost-thread-dev \
#     #     libeigen3-dev \
#     #     libcgal-dev libcgal-qt5-dev libgdal-dev libpcl-dev \
#     #     libdlib-dev libproj-dev libxerces-c-dev xvfb libjsoncpp-dev

#     if [ "$1" == "GCC" ]; then
#         echo "Setting up GCC"
#         export CC=gcc
#         export CXX=g++
# 		# export FFMPEG_INCLUDE_DIR=/home/archie/projects/QtFFmpegWrapper
# 		# export FFMPEG_AVCODEC_INCLUDE_DIR=/home/archie/projects/QtFFmpegWrapper/libavcodec

#     elif [ "$1" == "Clang" ]; then
#         echo "Setting up Clang"
#         export CC=clang
#         export CXX=clang++
# 		# export FFMPEG_INCLUDE_DIR=/home/archie/projects/QtFFmpegWrapper
# 		# export FFMPEG_AVCODEC_INCLUDE_DIR=/home/archie/projects/QtFFmpegWrapper/libavcodec
#     fi
# sudo rm -rf build
mkdir build_ninja
	# -DEIGEN_ROOT_DIR=/usr/include/eigen3 \
	#-DCMAKE_INSTALL_PREFIX:PATH="/home/archie/projects/cc/CC_install"
#cmake -B build -S . -G "Unix Makefiles" --install-prefix=/home/archie/projects/cc/CC_install \
cmake -B build_ninja -S . -G Ninja --install-prefix=/home/archie/projects/cc/nkmake \
	-DEIGEN_ROOT_DIR:PATH="/home/archie/projects/eigen-master/install/include/eigen3" \
	-DJSON_ROOT_DIR:PATH="/usr/include/jsoncpp" \
	-DDLIB_ROOT:PATH="/home/archie/miniconda3/envs/CloudCompareDev/lib" \
	-DFFMPEG_LIBRARY_DIR:PATH="/home/archie/miniconda3/envs/CloudCompareDev/lib" \
	-DFFMPEG_INCLUDE_DIR:PATH="/home/archie/miniconda3/envs/CloudCompareDev/include" \
	-DFFMPEG_AVCODEC_INCLUDE_DIR:PATH="/home/archie/miniconda3/envs/CloudCompareDev/lib" \
	-DCCCORELIB_SCALAR_DOUBLE=ON \
	-DTBB_DIR:PATH="/home/archie/miniconda3/envs/CloudCompareDev/lib/cmake/tbb" \
	-DCCCORELIB_USE_TBB=ON \
	-DPLUGIN_EXAMPLE_GL=ON \
	-DPLUGIN_EXAMPLE_IO=ON \
	-DPLUGIN_EXAMPLE_STANDARD=ON \
	-DPLUGIN_GL_QEDL=ON \
	-DPLUGIN_GL_QSSAO=ON \
	-DPLUGIN_IO_QADDITIONAL=ON \
	-DPLUGIN_IO_QCORE=ON \
	-DPLUGIN_IO_QE57=ON \
	-DPLUGIN_IO_QPHOTOSCAN=ON \
	-DPLUGIN_IO_QLAS=ON \
	-DPLUGIN_IO_QRDB=ON \
	-DPLUGIN_IO_QRDB_FETCH_DEPENDENCY=ON \
	-DPLUGIN_IO_QRDB_INSTALL_DEPENDENCY=ON \
	-DPLUGIN_STANDARD_QANIMATION=ON \
	-DQANIMATION_WITH_FFMPEG_SUPPORT=OFF \
	-DPLUGIN_STANDARD_QBROOM=ON \
	-DPLUGIN_STANDARD_QCANUPO=ON \
	-DPLUGIN_STANDARD_QCOMPASS=ON \
	-DPLUGIN_STANDARD_QCSF=ON \
	-DPLUGIN_STANDARD_QFACETS=ON \
	-DPLUGIN_STANDARD_QHOUGH_NORMALS=ON \
	-DPLUGIN_STANDARD_QHPR=ON \
	-DPLUGIN_STANDARD_QM3C2=ON \
	-DPLUGIN_STANDARD_QPCV=ON \
	-DPLUGIN_STANDARD_QPOISSON_RECON=ON \
	-DPLUGIN_STANDARD_QSRA=ON \
	-DPLUGIN_STANDARD_QRANSAC_SD=ON \
	-DPLUGIN_STANDARD_QPCL=ON \
	-DPLUGIN_STANDARD_QCLOUDLAYERS=ON \
	-DBUILD_TESTING=ON

#make -C build
cmake --build build_ninja --parallel
#make -j2 build

xvfb-run ctest --test-dir build_ninja

sudo cmake --install build_ninja
# }

# Call the function with your desired configuration
#ubuntu_build "GCC" "ON"
# ubuntu_build "Clang" "ON"
