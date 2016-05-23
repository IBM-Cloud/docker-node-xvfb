FROM nodesource/trusty:latest
RUN echo "unsafe-perm=true" >> .npmrc
RUN npm config set python `which python`
RUN apt-get update
RUN apt-get install fakeroot -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN add-apt-repository ppa:fkrull/deadsnakes
RUN apt-get update
RUN apt-get install gcc-4.9 -y
RUN apt-get install gcc-4.9-multilib -y
RUN apt-get install g++-4.9-multilib -y
RUN apt-get install zip -y
RUN apt-get install libgtk2.0-0 -y
RUN apt-get install python2.7 -y
RUN apt-get install libx11-dev -y
RUN apt-get install libgconf-2-4 -y
RUN apt-get install libnss3-dev -y
RUN apt-get install libasound2 -y
RUN apt-get install libxtst6 -y
RUN apt-get install libnotify4  -y
RUN apt-get install xvfb -y
RUN export DISPLAY=:99.0
RUN start-stop-daemon --start --quiet --pidfile /tmp/xvfb_99.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :99 -screen 0 1024x768x24 -ac +extension GLX +render -noreset
RUN sleep 5
