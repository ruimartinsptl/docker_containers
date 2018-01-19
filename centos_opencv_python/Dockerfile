FROM centos:7.4.1708
RUN yum install -y git

RUN yum groupinstall -y "Development Tools"

RUN yum install -y epel-release

RUN yum install -y python34 
RUN yum install -y python34-devel
RUN yum install -y python34-setuptools

RUN curl -O https://bootstrap.pypa.io/get-pip.py && /usr/bin/python3.4 get-pip.py && rm get-pip.py

RUN pip3 install numpy==1.13.3

RUN git clone https://github.com/Itseez/opencv.git && cd opencv && git checkout 3.3.0 && cd .. \
    && git clone https://github.com/Itseez/opencv_contrib.git && cd opencv_contrib && git checkout 3.3.0

# INSTALL OPENCV
# ENV OPENCV_VERSION="3.4.0"
ENV OPENCV_VERSION="3.3.0"
RUN yum install -y cmake git pkgconfig
RUN yum install -y libpng-devel libjpeg-turbo-devel jasper-devel openexr-devel libtiff-devel libwebp-devel
RUN yum install -y libdc1394-devel libv4l-devel gstreamer-plugins-base-devel
RUN yum install -y python-devel
RUN yum install -y tbb-devel
RUN yum install -y eigen3-devel
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

RUN ln -s /usr/local/lib/python3.4/site-packages/cv2.cpython-34m.so /usr/lib64/python3.4/site-packages/cv2.so

CMD ["python3"]
