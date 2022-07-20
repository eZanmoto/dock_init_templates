# Copyright 2022 Sean Kelleher. All rights reserved.
# Use of this source code is governed by an MIT
# licence that can be found in the LICENCE file.

# `$0 <test-dir>` runs the Rust tests for this project, using `test-dir` as a
# scratch space.

set -o errexit
set -o pipefail

if [ $# -ne 1 ] ; then
    echo "usage: $0 <test-dir>" >&2
    exit 1
fi

test_dir="$1"

templates_dir="$(pwd)"

cd "$test_dir"

dock init \
    --source dir:"$templates_dir":-:./templates \
    rust

output=$(
    dock run-in build-env: \
        cargo run
)

expect="hello, world!"

if ! echo "$output" | grep "$expect" ; then
    echo "unexpected output from \`dock run-in\`:" >&2
    echo "$output" \
        | sed 's/^/[>] /' \
        >&2
    echo "expected:" >&2
    echo "$expect" \
        | sed 's/^/[>] /' \
        >&2
    exit 1
fi
