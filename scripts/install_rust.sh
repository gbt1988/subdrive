#!/usr/bin/env bash

set -eu

export RUSTUP_HOME=/usr/local/rustup
export CARGO_HOME=/usr/local/cargo
export PATH=/usr/local/cargo/bin:$PATH

curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable --no-modify-path -y

chmod -R a+w+r /usr/local/cargo/
chmod -R a+w+r /usr/local/rustup/

rustup install nightly beta;

rustup target add wasm32-unknown-unknown --toolchain nightly;
