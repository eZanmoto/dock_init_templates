Dock `init` Templates
=====================

About
-----

This project defines templates for use with
[dock](https://github.com/ezanmoto/dock) `init`.

Usage
-----

This project isn't intended to be used directly, but to be used as a templates
source for `dock init`.

Development
-----------

### Build environment

The build environment for the project is defined in `build.Dockerfile`. The
build environment can be replicated locally by following the setup defined in
the Dockerfile, or `dock` can be used to mount the local directory in the build
environment by running `dock shell`.

### Testing

The project can be tested locally using `just check`, or the tests can be run
using `dock` by running the following:

    dock run-in build-env: just check

A successful run will return an exit status of 0.
