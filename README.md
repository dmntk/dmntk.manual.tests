**DMNTK** | Decision Model and Notation Toolkit

# Manual tests

[![MIT licensed][mit-badge]][mit-url]
[![Apache 2.0 licensed][apache-badge]][apache-url]
[![Contributor Covenant][coc-badge]](CODE_OF_CONDUCT.md)

[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg
[mit-url]: LICENSE-MIT
[apache-badge]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[apache-url]: LICENSE-APACHE
[coc-badge]: https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg

## Overview

This repository contains manual tests for **DMNTK** project.

Project **DMNTK** is tested automatically with all types of tests available in Rust.

Nevertheless, we maintain a bunch of manual tests in the following purposes:
- manual testing of edge cases,
- diagnostics of reported issues,
- visualization of functionalities provided by **DMNTK**,
- writing documentation, see: [dmntk.io](https://dmntk.io).

## Installing dependencies

Manual test framework requires `dmntk` binary to be installed.
The simplest way to install `dmntk` is from source using `cargo`:

```
$ cargo install dmntk
```

## Running manual tests

```
$ ./run.sh
```

To run manual tests for currently developed version of `dmntk`, set the path to the binary:

```
$ PATH=/home/your_user_name/your_path_to_dmntk_project/target/debug:$PATH ./run.sh
```

## Test directories structure

Test are organized in directories starting from `./tests` (root directory).
Each directory may contain either subdirectories or test files.

## Test files structure

There are always four test files prepared for each test:
1. Text file containing tested expression, decision table or DMN model, may have any name.
2. Text file containing test execution context, may have any name.
3. Text file containing expected result, should always be named `expected`.
4. Shell script containing a command that runs a test, should always be named `run.sh`.

## Example test

Directory `tests/feel/addition/0001` contains a test that checks addition operation of two number literals:
1. Tested expression is `1 + 1` and is saved in `0001.feel` file. 
2. Test execution context is empty `{}` and is saved in `0001.ctx` file.
3. Expected value is `2` and is saved in `expected` file.
4. Script that executes a test contains a command `dmntk efe 0001.ctx 0001.feel` and is saved in `run.sh` file.

## License

Licensed under either of

- [MIT license](https://opensource.org/licenses/MIT) ([LICENSE-MIT](https://github.com/dmntk/dmntk.rs/blob/main/LICENSE-MIT))
- [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0) ([LICENSE-APACHE](https://github.com/dmntk/dmntk.rs/blob/main/LICENSE-APACHE))

at your option.
