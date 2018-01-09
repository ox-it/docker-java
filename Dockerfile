#
# Oracle Java 8 Dockerfile
# 

# Pull base image.
FROM ubuntu:14.04.4

# Install curl so we can grab the file
RUN \
  apt-get -qq update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -qq -y curl && \
  rm -rf /var/lib/apt/lists/*

# Who did this?
MAINTAINER Matthew Buckett <matthew.buckett@it.ox.ac.uk>

# The version we're getting. 
# Make sure to update the URL when this gets changed
ENV JDK_VERSION jdk-8u151
# If you need to build a newer version without changing the JDK version increment the build version.
ENV BUILD_VERSION 01

# Do stuff in /tmp
WORKDIR /tmp

# Install Java.
RUN \
  curl -s -L -o $JDK_VERSION.tgz -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz && \
  mkdir -p /opt/jdk/$JDK_VERSION && \
  tar -zxf $JDK_VERSION.tgz -C /opt/jdk/$JDK_VERSION --strip-components 1 && \
  rm $JDK_VERSION.tgz && \
  update-alternatives --install /usr/bin/java java /opt/jdk/$JDK_VERSION/bin/java 100 && \
  update-alternatives --install /usr/bin/javac javac /opt/jdk/$JDK_VERSION/bin/javac 100 && \
  update-alternatives --install /usr/bin/jar jar /opt/jdk/$JDK_VERSION/bin/jar 100

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /opt/jdk/$JDK_VERSION
