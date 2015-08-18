############################################################
# Dockerfile to build a Jenkins server
# Based on appcontainers/jenkins
############################################################

# Set the base image to appcontainers/jenkins
FROM appcontainers/jenkins

# File Author / Maintainer
MAINTAINER Naoufel EL HAJ naoufel.elhaj@gmail.com

#*************************
#  Update git version    *
#*************************
RUN rpm -i "http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm" \
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt \
yum -y --enablerepo=rpmforge-extras install git

#*************************
#*  Update Java version  *
#*************************
RUN yum -y remove java-1.7.0-openjdk java-1.7.0-openjdk-devel \
RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel \
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64