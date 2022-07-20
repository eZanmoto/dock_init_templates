FROM rust:1.60.0-buster

RUN \
    rustup component add \
        clippy
