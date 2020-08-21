FROM gcc:latest

WORKDIR /usr/src
RUN apt-get -y update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
        cmake bison flex gdb libxaw7-dev xfonts-utils && \
        git clone https://github.com/json-c/json-c.git && \
        mkdir jsonc-build 
WORKDIR /usr/src/jsonc-build
RUN cmake ../json-c && \
        make install
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib
WORKDIR /usr/src
