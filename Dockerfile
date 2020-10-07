FROM ubuntu:latest
LABEL maintainer "aarunalr <harunalr1596@gmail.com>"

RUN ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8

# Install apt
RUN apt-get -qq update && apt-get -qq install -y --no-install-recommends \
    python-setuptools \
    python3-dev \
    python3-pip \
    dpkg-dev \
    gcc \
    libbluetooth-dev \
    libbz2-dev \
    libc6-dev \
    libexpat1-dev \
    libffi-dev \
    libgdbm-dev \
    liblzma-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    make \
    tk-dev \
    uuid-dev \
    wget \
    xz-utils \
    zlib1g-dev \
    apt-utils \
    aria2 \
    bash \
    build-essential \
    curl \
    figlet \
    neofetch \
    postgresql \
    pv \
    jq \
    ffmpeg \
    libxml2 \
    libssl-dev \
    wget \
    zip \
    unzip \
    unar \
    git \
    libpq-dev \
    sudo \
    megatools

# Install google chrome
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt-get -qq update && apt-get -qq install -y google-chrome-stable

# Install chromedriver
RUN wget -N https://chromedriver.storage.googleapis.com/85.0.4183.87/chromedriver_linux64.zip -P ~/ && \
    unzip ~/chromedriver_linux64.zip -d ~/ && \
    rm ~/chromedriver_linux64.zip && \
    mv -f ~/chromedriver /usr/bin/chromedriver && \
    chown root:root /usr/bin/chromedriver && \
    chmod 0755 /usr/bin/chromedriver

# Install python requirements
RUN pip3 install -r https://raw.githubusercontent.com/goodmeow/openubot/sql-extended/requirements.txt

CMD ["bash"]
