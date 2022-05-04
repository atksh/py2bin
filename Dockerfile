FROM debian:bullseye-slim as py2bin
RUN apt-get update -y \
    && apt-get install --no-install-recommends -y \
    build-essential \
    ccache \
    libfuse2 \
    patchelf \
    python3.9 \
    python3.9-dev \
    python3-distutils \
    curl \
    file \
    wget \
    upx \
    ca-certificates \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3.9 get-pip.py \
    && python3.9 -m pip install nuitka zstandard
    
RUN wget "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage" \
    && chmod a+x appimagetool-x86_64.AppImage \
    && mv appimagetool-x86_64.AppImage /usr/local/bin/appimagetool

FROM py2bin as base
COPY src/requirements.txt .
RUN python3.9 -m pip install --no-cache -r requirements.txt

WORKDIR /work
ENV CCFLAGS "-O3 -pipe -fpid -fstack-protector-strong -fstack-clash-protection -fcf-protection -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS"
COPY src /work/src
COPY convert.sh /work
RUN chmod +x /work/convert.sh
ENTRYPOINT /work/convert.sh

