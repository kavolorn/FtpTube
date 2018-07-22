FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y \
    automake \
    ant \
    autopoint \
    cmake \
    build-essential \
    libtool \
    patch \
    pkg-config \
    # protobuf-compiler \
    ragel \
    subversion \
    unzip \
    git \
    openjdk-8-jre \
    openjdk-8-jdk \
    flex \
    python \
    wget \
    curl

RUN curl -OL https://github.com/google/protobuf/releases/download/v3.3.0/protoc-3.3.0-linux-x86_64.zip && \
    unzip protoc-3.3.0-linux-x86_64.zip -d protoc3 && \
    mv protoc3/bin/* /usr/local/bin/ && \
    mv protoc3/include/* /usr/local/include/ && \
    rm protoc-3.3.0-linux-x86_64.zip

RUN mkdir /vlc_build

RUN wget -P /vlc_build/ --progress=bar:force https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip \
	&& unzip /vlc_build/sdk-tools-linux-4333796.zip -d /vlc_build/sdk-tools-linux \
	&& rm /vlc_build/*.zip

RUN wget -P /vlc_build/ --progress=bar:force https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip \
	&& unzip /vlc_build/android-ndk-r14b-linux-x86_64.zip -d /vlc_build/android-ndk \
	&& rm /vlc_build/*.zip

RUN /vlc_build/sdk-tools-linux/tools/bin/sdkmanager --update

ENV ANDROID_SDK /vlc_build/sdk-tools-linux
ENV ANDROID_NDK /vlc_build/android-ndk/android-ndk-r14b
ENV PATH $PATH:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools

RUN cd /vlc_build && git clone https://code.videolan.org/videolan/vlc-android.git

WORKDIR /vlc_build/vlc-android
# RUN cd /vlc_build/vlc-android && ./compile.sh -a armeabi-v7a
