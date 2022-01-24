FROM alpine:3.12

RUN set -xe \
    && apk add --no-cache \
        bash \
        ca-certificates \
        curl \
        sudo \
        libssl1.1 \
        libxml2 \
        openssl \
        mailx \
        msmtp \
        libcurl \
        mosquitto \
        mosquitto-clients \
        libuuid \
        python3 \
        python3-dev \
        wiringpi \
        rsyslog \
        libcap-dev \
 && ln -sf /usr/bin/python3 /usr/bin/python \
    && python -m ensurepip \
    && apk del \
        python3-dev
ENV USER p4d
RUN adduser -D "${USER}" ${USER}
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER} && chmod 0440 /etc/sudoers.d/${USER}
#WORKDIR /home/${USER}
USER ${USER}
#Add German locales
ENV MUSL_LOCALE_DEPS cmake make musl-dev gcc gettext-dev libintl
ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

RUN apk add --no-cache \
    $MUSL_LOCALE_DEPS \
    && wget https://gitlab.com/rilian-la-te/musl-locales/-/archive/master/musl-locales-master.zip \
    && unzip musl-locales-master.zip \
      && cd musl-locales-master \
      && cmake -DLOCALE_PROFILE=OFF -D CMAKE_INSTALL_PREFIX:PATH=/usr . && make && make install \
      && cd .. && rm -r musl-locales-master
RUN sudo touch /usr/share/locale/locale.alias
RUN sudo sed -i '/de_DE.UTF-8/s/^# //g' /etc/locale.gen && sudo locale-gen
ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE.UTF-8
ENV LC_ALL de_DE.UTF-8
#export ENV
RUN set -o allexport

