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
    git
RUN apt install -y \
    build-essential \
    bison \
    gperf \
    cmake \
    libsqlite3-dev \
    libaspell-dev \
    libpcre3-dev \
    nettle-dev \
    g++ \
    libcurl4-openssl-dev 

RUN git clone https://github.com/lisdude/toaststunt.git
WORKDIR /app/toaststunt
RUN mkdir build
WORKDIR /app/toaststunt/build
RUN cmake ../
RUN make -j2

# Let's copy over the executable and databases for convenience.
# Also normalize the names a bit because capitals are just fugly
# in filenames.
RUN cp ./moo /app
RUN cp ../Minimal.db /app/minimal.db

WORKDIR /app
RUN git clone https://github.com/lisdude/toastcore.git
run cp toastcore/toastcore.db ./

# So now we just have to pull in the latest sakura database.
WORKDIR /app
RUN git clone https://github.com/basp/sakura
WORKDIR /app/sakura
RUN cp ./sakura.db ..

ADD init.sh /
RUN chmod a+x /init.sh

# And here we are.
WORKDIR /
ENTRYPOINT /init.sh
