[![Makefile CI](https://github.com/rzuckerm/solidity-docker-image/actions/workflows/makefile.yml/badge.svg)](https://github.com/rzuckerm/solidity-docker-image/actions/workflows/makefile.yml)

# solidity-docker-image

Docker image for [Solidity programming language](https://docs.soliditylang.org/):

- rzuckerm/solidity:`<version>-<tag>`

where:

- `<version>` is the [Solidity version](SOLIDITY_VERSION)
- `<tag>` is the current GitHub tag without the "v"

The docker image can be found [here](https://hub.docker.com/r/rzuckerm/solidity).

## Structure of Program

The structure of the program is expected to be this:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract <program_name> {
    function main (string memory args) public pure returns (...) {
        ...
    }
}
```

where:

- `<program_name>` is the filename without extension

## Compiling

To compile the program run `compile_solidity <program_name>.sol`. This does the following:

- Create a directory called `<program_name>`
- In directory `<program_name>`, run `truffle init`
- Copy the `<program_name>.sol` to `<program_name>/contracts`
- Create a migration script in `<program_name>/migrations`

## Running

To run the program run `run_solidity <program_name> <args>`. This does the following in
the `<program_name>` directory:

- Start the server with `ganache --detach`, and save off the server name (`<server_name>`)
- Run the migrations with `truffle migrate --compile-none --quiet`
- Run the `<program_name>` contract with `truffle call <program_name> <args_string>`, decode
  the output, and display the results of the decode. For example, if this is the output,
  ```
  Returned values: (
    "Hello, world!\n" (type: string)
  )
  ```

  then, `"Hello, world!\n"` is output
- Stop the server with `ganache instances stop <server_name>`

where:

- `<args>` are the command-line arguments
- `<args_string>` is a concatenation of each arguments terminated with a null. For example,
  if `<args>` is `hello world`, then `<args_string>` is `hello\0world\0`, where `\0` is the
  null character (ASCII 0)
