# About Sub-Box

**A handy tool makes the development on Substrate more smooth and friendly,  features included:**

* Remote boost service to make Substrate compiling faster;
* A quick multi-node environment to test your MVP in a production environment.
* Smart contract sandbox.
* All-in-one depolyment helper;
* Nocode (draw and drag) for Substrate;


# RCS, a remote comiling service module of Sub-Box

 A free compiling speed up service for Substrate community includes Kusama, Polkadot, and parachain teams which makes development on substrate more efficiency.

## Use remote comiling service

1. Raise an issue in this repo like [this one](https://github.com/sub-box/sub-box/issues/2) to get authorized.

2. Install `cargo remote` on your local machine:
```shell
curl https://sh.rustup.rs -sSf | sh
```

3. Install cargo remote on your local machine.
```shell
git clone https://github.com/sgeisler/cargo-remote.git
cargo install --path cargo-remote/
```

4. Now go to Substrate based codebase, and use the compiling service.replace `popeye-rs` with your username:
```shell
cd substrate-node-template

<<<<<<< HEAD
cargo remote -r popeye-rs@us1.subbox.dev -- build --release
``` 
=======
cargo remote -r popeye-rs@us1.popeye.rs -- build --release
```

<<<<<<< HEAD
>>>>>>> 39dd139... edit Readme.md
>>>>>>> b464632... edit Readme.md

=======
>>>>>>> a6e9f3e... delete some err
## License
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)

Copyright (C) 2020, Substrate Box

This program is free software: you can redistribute it and/or modify it under the terms of the license provided in the LICENSE file (GPLv3).  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
