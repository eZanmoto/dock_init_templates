# Copyright 2022 Sean Kelleher. All rights reserved.
# Use of this source code is governed by an MIT
# licence that can be found in the LICENCE file.

# `$0` runs the tests for this project.

set -o errexit
set -o pipefail

if [ $# -ne 0 ] ; then
    echo "usage: $0" >&2
    exit 1
fi

tgt_dir='target'
tgt_test_dir="$tgt_dir/tests"

mkdir \
    --parents \
    "$tgt_dir"

rm \
    -r \
    -f \
    "$tgt_test_dir"

mkdir "$tgt_test_dir"

bash scripts/test_rust.sh "$tgt_test_dir"
