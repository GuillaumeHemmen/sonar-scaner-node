FROM debian:stretch

LABEL maintainer="guillaume@van-hemmen.com"

RUN apt-get update && \
    apt-get -y install curl wget unzip && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update && apt install -y yarn && \
    cd /root/ && \
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip && \
    unzip sonar-scanner-cli-3.3.0.1492-linux.zip && \
    ln -sf /root/sonar-scanner-3.3.0.1492-linux/bin/sonar-scanner /usr/local/bin/sonar-scanner
