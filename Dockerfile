FROM gcc:latest

WORKDIR /usr/src
RUN apt-get -y update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
        cmake bison flex gdb libxaw7-dev xfonts-utils \
        npm && \
        git clone https://github.com/json-c/json-c.git && \
        mkdir jsonc-build
WORKDIR /usr/src/jsonc-build
RUN cmake ../json-c && \
        make install && \
        npm update && \
        npm install node && \
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib
WORKDIR /usr/src
