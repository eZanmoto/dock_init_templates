# Copyright 2022 Sean Kelleher. All rights reserved.
# Use of this source code is governed by an MIT
# licence that can be found in the LICENCE file.

# `$0 <org> <proj> <version>` installs the specificed `version` of the GitHub
# project `<org>/<proj>`.

set -o errexit
set -o pipefail

if [ $# -ne 3 ] ; then
    echo "usage: $0 <org> <proj> <version>" >&2
    exit 1
fi

org="$1"
proj="$2"
version="$3"

tmp_dir=$(mktemp --directory)

# We always retrieve the `x86_64-unknown-linux-musl` version of the binary for
# now. This may be taken as a parameter in future, if necessary.
tgt='x86_64-unknown-linux-musl'
tar_name="${proj}-${version}-${tgt}.tar.gz"
tar_url="https://github.com/$org/$proj/releases/download/$version/$tar_name"

curl \
        --fail \
        --show-error \
        --silent \
        --location \
        --proto '=https' \
        --tlsv1.2 \
        "$tar_url" \
    | tar \
        --extract \
        --gzip \
        --directory="$tmp_dir" \

install \
    --mode 755 \
    "$tmp_dir/$proj" \
    '/usr/local/bin'

rm "$tmp_dir/$proj"
