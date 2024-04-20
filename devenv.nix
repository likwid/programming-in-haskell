{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ 
    pkgs.git 
    pkgs.jq
    pkgs.stack
  ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";
  cachix.enable = false;

  enterShell = ''
    hello
    git --version
    stack --version
    jq --version
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep "2.44.0"
    stack --version | grep "2.15.3"
    jq --version | grep "1.7.1"
  '';
}
