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

# We'll clone the hellcore source from necanthrope which
# seems legit. With the prerequisites above we should be able 
# to compile this thing. Just ignore the warnings.
RUN git clone https://github.com/toddsundsted/stunt.git
WORKDIR /app/stunt
# RUN git clone https://github.com/necanthrope/hellcore .
RUN ./configure
RUN make

# Let's copy over the executable and databases for convenience.
# Also normalize the names a bit because capitals are just fugly
# in filenames.
RUN cp ./moo ..
RUN cp ./Minimal.db ../minimal.db

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
