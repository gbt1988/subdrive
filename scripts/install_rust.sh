#!/usr/bin/env bash

set -eu

# Install rust toolchain
export RUSTUP_HOME=/usr/local/rustup
export CARGO_HOME=/usr/local/cargo
export PATH=/usr/local/cargo/bin:$PATH

curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable --no-modify-path -y

chmod -R a+w+r /usr/local/cargo/
chmod -R a+w+r /usr/local/rustup/

rustup install nightly beta
rustup target add wasm32-unknown-unknown --toolchain nightly

# Auto upgrade at midnight
CRON_CONFIG=/root/crontab_temp
touch $CRON_CONFIG
echo "0 0 * * * /usr/local/cargo/rustup update >/root/rustup-update.log 2>&1;chmod -R a+w+r /usr/local/cargo/;chmod -R a+w+r /usr/local/rustup/;" >> $CRON_CONFIG
crontab $CRON_CONFIG
rm $CRON_CONFIG

# Enable rustup and cargo for all users
PROFILE_FILE=/etc/profile
echo "export PATH=/usr/local/cargo/bin:$PATH" >> $PROFILE_FILE
echo "export RUSTUP_HOME=/usr/local/rustup" >> $PROFILE_FILE
echo "export CARGO_HOME=/usr/local/cargo" >> $PROFILE_FILE
