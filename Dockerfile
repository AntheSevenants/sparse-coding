FROM alpine:3.19

# Install dependencies
RUN apk add unzip make g++

RUN mkdir /opt/tools/
WORKDIR /opt/tools/

# Download and extract eigen
RUN wget -O eigen.zip "https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip"
RUN unzip eigen.zip
RUN mv eigen-3.4.0 eigen
RUN rm eigen.zip

# Compiling
RUN mkdir /sparse/
WORKDIR /sparse/

COPY * /sparse/

RUN make
RUN make nonneg

ENTRYPOINT [ "./sparse.o" ]