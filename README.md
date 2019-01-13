# fish-mock

Quick and powerful fish shell mocks

Inspired by [Markcial/mock](https://github.com/Markcial/mock)

## Installation

### [Fisher](https://github.com/jorgebucaran/fisher)

```fish
fisher add matchai/fish-mock
```

## Usage

```
$ mock

  Usage
    $ mock <command> <argument> <exit code> [executed code]

  Arguments
    command        The command you would like to have mocked
    argument       The argument the mock should apply to ('*' defines a fallback for all arguments)
    exit code      The exit code returned when the command executes
    executed code  Code to be executed when the command is called with the given argument

  Examples
    $ mock git pull 0 "echo This command successfully echoes"
    $ mock git push 1 "echo This command fails with status 1"
    $ mock git \* 0 "echo This command acts as a fallback to all git commands"

  Tips
    To view this manual, use the mock command without providing arguments.
    Many mocks can be applied to the same command at the same time with different arguments.
    Be sure to escape the asterisk symbol when using it as a fallback (\*).
```

## License

ISC © [Matan Kushner](https://matchai.me/)
