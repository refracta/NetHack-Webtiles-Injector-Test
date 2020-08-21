FROM gcc:latest

WORKDIR /usr/src
RUN apt-get -y update && \
        apt-get install -y cmake bison flex gdb && \
        git clone https://github.com/json-c/json-c.git && \
        mkdir jsonc-build 
WORKDIR /usr/src/jsonc-build
RUN cmake ../json-c && \
        make install
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib

WORKDIR /usr/src/nethack
RUN sh sys/unix/setup.sh sys/unix/hints/linux-webtiles
