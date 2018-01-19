FROM centos:7.4.1708
RUN yum install -y git

RUN yum install -y epel-release
RUN yum install -y python34 python34-devel python34-setuptools
RUN curl -O https://bootstrap.pypa.io/get-pip.py && /usr/bin/python3.4 get-pip.py && rm get-pip.py

RUN git clone https://github.com/Itseez/opencv.git && cd opencv && git checkout 3.3.0 \
    && git clone https://github.com/Itseez/opencv_contrib.git && cd opencv_contrib && git checkout 3.3.0
    
RUN cd opencv && mkdir build && cd build && cmake \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_DOCS=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_OPENCV_PYTHON2=ON \
    -D BUILD_OPENCV_PYTHON3=ON \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=OFF \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    -D PYTHON_DEFAULT_EXECUTABLE=$(which python3) \
    -D WITH_TBB=ON \
    -D WITH_EIGEN=ON \
    -D WITH_OPENCL=OFF -D WITH_CUDA=OFF -D BUILD_opencv_gpu=OFF -D BUILD_opencv_gpuarithm=OFF -D BUILD_opencv_gpubgsegm=OFF -D BUILD_opencv_gpucodec=OFF -D BUILD_opencv_gpufeatures2d=OFF -D BUILD_opencv_gpufilters=OFF -D BUILD_opencv_gpuimgproc=OFF -D BUILD_opencv_gpulegacy=OFF -D BUILD_opencv_gpuoptflow=OFF -D BUILD_opencv_gpustereo=OFF -D BUILD_opencv_gpuwarping=OFF \
    .. && \
    make -j8 && \
    make install

CMD ["python3"]
