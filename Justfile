# Copyright 2022 Sean Kelleher. All rights reserved.
# Use of this source code is governed by an MIT
# licence that can be found in the LICENCE file.

tgt_dir := join(justfile_directory(), 'target')
tgt_test_dir := join(tgt_dir, 'tests')

# List available recipes.
default:
    just --list

# Run all checks.
check: check_intg

# Run integration tests.
check_intg: remake_test_dir
    bash scripts/test_rust.sh '{{tgt_test_dir}}'

# Remove and create the test directory.
remake_test_dir:
    mkdir \
        --parents \
        '{{tgt_dir}}'
    rm \
        --recursive \
        --force \
        '{{tgt_test_dir}}'
    mkdir '{{tgt_test_dir}}'
