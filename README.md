<p align="center">
  <img alt="Fish" src="https://user-images.githubusercontent.com/4658208/51090739-9ec35480-174e-11e9-8a64-4b375107bb38.png" width=80px>
  <img alt="Performance arts masks" src="https://user-images.githubusercontent.com/4658208/51090736-90753880-174e-11e9-82ba-36a703822c8e.png" width=80px>
  <h3 align="center">fish-mock</h3>
  <p align="center">Quick and powerful fish shell mocks</p>
  <p align="center">
    <a href="https://travis-ci.org/matchai/fish-mock"><img src="https://badgen.net/travis/matchai/fish-mock" alt="Build Status"></a>
    <a href="https://fishshell.com/"><img src="https://badgen.net/badge/fish/v3.0.0" alt="Fish Version"></a>
    <a href="https://github.com/matchai/fish-mock/blob/master/LICENSE"><img src="https://badgen.net/github/license/matchai/fish-mock" alt="License"></a>
  </p>
</p>

---

**fish-mock** provides a quick and easy way to override the behavior of commands for use when testing. Mocking commands causes them to behave predictably, allowing you isolate and focus on the code being tested.

## Installation

### [Fisher](https://github.com/jorgebucaran/fisher)

```fish
fisher add matchai/fish-mock
```

## Usage

```
$ mock

  Usage
    $ mock <command> <argument> [exit code] [executed code]
    $ unmock <command>

  Arguments
    command        The command you would like to have mocked
    argument       The argument the mock should apply to ('*' defines a fallback for all arguments)
    exit code      The exit code returned when the command executes
    executed code  Code to be executed when the command is called with the given argument

  Examples
    $ mock git pull 0 "echo This command successfully echoes"
    $ mock git push 1 "echo This command fails with status 1"
    $ mock git \*   0 "echo This command acts as a fallback to all git commands"
    $ unmock git      # Original git functionality is now restored

  Tips
    To view this manual, use the mock command without providing arguments.
    The array of arguments ($argv) is accessible within mocked functions as $args.
    Many mocks can be applied to the same command at the same time with different arguments.
    Be sure to escape the asterisk symbol when using it as a fallback (\*).
```

## License

ISC © [Matan Kushner](https://matchai.me/)
