# Use Ubuntu 16.04 LTS
FROM ubuntu:xenial-20200114

# Prepare environment
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ xenial universe" >> /etc/apt/source.list && \
    echo "deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates universe" >> /etc/apt/source.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
                    curl bzip2 ca-certificates        \
                    tcsh xfonts-base python-qt4       \
                    python-matplotlib                 \
                    gsl-bin netpbm gnome-tweak-tool   \
                    libjpeg62 xvfb xterm vim curl     \
                    gedit evince eog                  \
                    libglu1-mesa-dev libglw1-mesa     \
                    libxm4 build-essential            \
                    gnome-terminal nautilus           \
                    gnome-icon-theme-symbolic         \
                    firefox xfonts-100dpi             && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -O https://afni.nimh.nih.gov/pub/dist/bin/misc/@update.afni.binaries && \
    tcsh @update.afni.binaries -package linux_ubuntu_16_64 -do_extras -bindir /opt/afni
