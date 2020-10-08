# Substrate Box

A smart box which makes the development on Substrate friendly, features planned:

* Substrate compiling service;
* All-in-one depolyment helper;
* Nocode (draw and drag) for Substrate;
* Smart contract sandbox.

## How to use comiling service

1. Raise an issue in this repo like [this one](https://github.com/sub-box/sub-box/issues/2). The issue will close once new user is added.

2. Install cargo remote on your local machine:
```shell
git clone https://github.com/sgeisler/cargo-remote
cargo install --path cargo-remote/
```

3. Now try to use the compiling service, replace `popeye-rs` with your username:
```shell
cargo remote -r popeye-rs@172.96.172.13 -- build --release
``` 

## License
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)

Copyright (C) 2020, Substrate Box

This program is free software: you can redistribute it and/or modify it under the terms of the license provided in the LICENSE file (GPLv3).  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.