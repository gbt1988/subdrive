#!/usr/bin/env bash

set -eu

# Install Rust for each user

USER_NAME=sample3

su - $USER_NAME -c "curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable --no-modify-path -y"

su - $USER_NAME -c "rustup install nightly-2020-10-05; rustup target add wasm32-unknown-unknown --toolchain nightly-2020-10-05"
