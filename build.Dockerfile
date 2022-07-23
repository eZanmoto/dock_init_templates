# Copyright 2022 Sean Kelleher. All rights reserved.
# Use of this source code is governed by an MIT
# licence that can be found in the LICENCE file.

FROM docker:19.03.8

RUN \
    apk add \
        --no-cache \
        bash=5.0.11-r1 \
        coreutils=8.31-r0 \
        curl=7.79.1-r0

RUN \
    mkdir /scripts

COPY \
    scripts/install_from_github.sh \
    /scripts

RUN \
    bash /scripts/install_from_github.sh \
            'casey' \
            'just' \
            '1.1.3' \
        && bash /scripts/install_from_github.sh \
            'ezanmoto' \
            'dock' \
            '0.34.1'
