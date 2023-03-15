#!/bin/bash

# Thanks to https://gist.github.com/wenzhixin/43cf3ce909c24948c6e7
# Execute this script in your home directory. Lines 17 and 21 will prompt you for a y/n

# Install Oracle JDK 8
sudo apt-get update
sudo apt install openjdk-8-jdk openjdk-8-jre
sudo apt-get install -y unzip make # NDK stuff

# Get SDK tools (link from https://developer.android.com/studio/index.html#downloads)
wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar xf android-sdk*-linux.tgz

# Get NDK (https://developer.android.com/ndk/downloads/index.html)
wget https://dl.google.com/android/repository/android-ndk-r19b-linux-x86_64.zip
unzip android-ndk*.zip
mkdir -p Android
mkdir -p mobile/builds

mv -v android-ndk-r17c Android/Ndk
mv -v android-sdk-linux Android/Sdk
# Let it update itself and install some stuff
cd Android/Sdk/tools
./android update sdk --no-ui

# Download every build-tools version that has ever existed
# This will save you time! Thank me later for this
./android update sdk --all --no-ui --filter $(seq -s, 27)

# If you need additional packages for your app, check available packages with:
# ./android list sdk --all

# install certain packages with:
# ./android update sdk --no-ui --all --filter 1,2,3,<...>,N
# where N is the number of the package in the list (see previous command)


# Add the directory containing executables in PATH so that they can be found
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools' >> ~/.bashrc

source ~/.bashrc

# Make sure you can execute 32 bit executables if this is 64 bit machine, otherwise skip this
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y libc6:i386 libstdc++6:i386 zlib1g:i386

# Add some swap space, useful if you've got less than 2G of RAM
sudo fallocate -l 2G /swapfile 
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# Optionally run build system as daemon (speeds up build process)
mkdir ~/.gradle
echo 'org.gradle.daemon=true' >> ~/.gradle/gradle.properties
# See here: https://www.timroes.de/2013/09/12/speed-up-gradle/

#remove obsolute packages
cd ~/
#!/bin/bash
for i in $(seq 7 22)
do
   rm -dvrf ~/Android/Sdk/platforms/android-$i
done

# Install necessary system packages
sudo apt-get install -y \
    python-pip \
    python3-pip \
    build-essential \
    mercurial \
    git \
    python \
    python3 \
    python3-dev \
    python-dev \
    ffmpeg \
    libsdl-image1.2-dev \
    libsdl-mixer1.2-dev \
    libsdl-ttf2.0-dev \
    libsmpeg-dev \
    libsdl1.2-dev \
    libportmidi-dev \
    libswscale-dev \
    libavformat-dev \
    libavcodec-dev \
    zlib1g-dev \
    autogen \
    autoconf \
    libtool \
    libffi-dev \
    zip
    
# Install gstreamer for audio, video (optional)
sudo apt-get install -y \
    libgstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good
    
# install the correct Cython version
pip3 install Cython==0.29.10
pip3 install cpython
pip3 install numpy
pip3 install kivy
pip3 install buildozer
pip3 install kivmob
pip3 install kivy-garden
garden install iconfonts
garden install navigationdrawer
