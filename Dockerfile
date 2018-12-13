FROM debian:stretch

MAINTAINER Joel Nitta <joelnitta@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

####################################################################
# Application: AlignWise
# Version: 0.38
# Description: Identify biologically relevant protein-coding regions
# whilst correcting for frame-shifts
####################################################################

RUN apt-get update && apt-get install -y \
  muscle \
  ncbi-blast+ \
  bioperl \
  libparallel-forkmanager-perl \
  wise \
  wget \
  git \
  && apt-get clean && apt-get purge

ENV APPS_HOME=/apps
ENV APP_NAME=AlignWise
ENV VERSION=0.38
ENV DEST=$APPS_HOME/$APP_NAME

RUN mkdir $APPS_HOME

WORKDIR $APPS_HOME

RUN git clone https://github.com/TeriForey/$APP_NAME.git \
  && printf '#!/bin/bash\n' > alignwise \
  && echo $DEST/AlignWise.pl' $*' >> alignwise \
  && chmod +x alignwise \
  && mv alignwise /bin

WORKDIR /home

ENTRYPOINT ["alignwise"]
