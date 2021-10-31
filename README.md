**DMNTK** | Decision Model and Notation Toolkit

# dmntk-manual-tests

[![MIT licensed][mit-badge]][mit-url]
[![Apache 2.0 licensed][apache-badge]][apache-url]

[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg
[mit-url]: LICENSE-MIT
[apache-badge]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[apache-url]: LICENSE-APACHE

## Overview

Manual tests for project `DMNTK`.

Project `DMNTK` is tested automatically with all kind of tests available in Rust.

Nevertheless, we maintain a bunch of manual tests in the following purposes:
- manual testing of edge cases,
- diagnostics of reported issues,
- visualization of functionalities provided by `DMNTK`,
- writing documentation [The DMNTK Book](https://github.com/dmntk/book).

## Installing dependencies

Manual test framework requires `dmntk` binary to be installed.
The simplest way to install `dmntk` is to use `cargo` tool:

```
$ cargo install dmntk --features=bin
```

## Running manual tests

```
$ ./run.sh
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
4. Script that executes a test contains a command `dmntk etx 0001.feel 0001.ctx` and is saved in `run.sh` file.

## License

**dmntk-manual-tests** is distributed under the terms of both
the MIT&nbsp;license and the Apache&nbsp;License&nbsp;(Version&nbsp;2.0).
See [LICENSE-MIT](LICENSE-MIT) and [LICENSE-APACHE](LICENSE-APACHE) for details.
