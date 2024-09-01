FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y git iputils-ping vim

# Prereqs for AndroidStudio according to https://developer.android.com/studio/install
RUN apt-get install -y libc6 libncurses5 libstdc++6 lib32z1 libbz2-1.0

# Libs needed to be able to display on the host's X server
RUN apt-get install -y libfreetype-dev libxext-dev libxrender-dev libxtst-dev

RUN apt-get install -y adb

# The filename of the .tar.gz file will change when the version updates and I 
# download a new one. So use a wildcard to grab what should be exactly one 
# matching file.
# Use ADD instead of COPY since we want to unpack it and don't need the .tar.gz afterward
ADD android-studio* /opt


# You can't just start studio here. After starting the container, you have to open
# a root shell and run adb start-server. I could do that in the Dockerfile but it isn't 
# worth the effort.

CMD ["/bin/bash"]
#CMD ["/opt/android-studio/bin/studio.sh"]
