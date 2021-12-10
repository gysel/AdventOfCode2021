FROM gitpod/workspace-full

USER gitpod

# Install Julia
RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.0-linux-x86_64.tar.gz \
        && tar zxvf julia-1.7.0-linux-x86_64.tar.gz \
        && sudo ln -s $(pwd)/julia-1.7.0/bin/julia /usr/bin/julia

# Give control back to Gitpod Layer
USER root