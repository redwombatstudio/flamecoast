# You could try other base images if you want.
FROM ubuntu

# Your choice.
WORKDIR /app

# By default, the MOO runs on port 7999 so we'll expose that.
EXPOSE 7777

# We need this to stuff to build the hellcore source
RUN apt-get update && apt-get install -y \
    make \
    g++ \
    gperf \
    byacc \
    flex \
    autoconf \
    git \
    wget

RUN git clone https://github.com/toddsundsted/stunt.git
WORKDIR /app/stunt
RUN ./configure
RUN make
RUN cp ./moo ..
RUN cp ./Minimal.db ../minimal.db

# Download, compile, and install moobrowser cli
WORKDIR /app/moobrowser
RUN wget https://neil.fraser.name/software/moobrowser/moobrowser.c
RUN gcc moobrowser.c -o moobrowser
RUN cp moobrowser /

# Pull in the latest sakura database.
WORKDIR /app
RUN git clone https://github.com/basp/sakura
WORKDIR /app/sakura
RUN cp ./sakura.db ..

# Upload the startup file
ADD init.sh /
RUN chmod a+x /init.sh

# And here we are.
WORKDIR /
ENTRYPOINT /init.sh
