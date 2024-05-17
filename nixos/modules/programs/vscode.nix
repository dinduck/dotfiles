{
  config,
  pkgs-unstable,
  lib,
  ...
}: let
  cfg = config.modules.programs.vscode;
  pkgs = pkgs-unstable;
in {
  options.modules.programs.vscode = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "my vscode config";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (
        vscode-with-extensions.override {
          vscodeExtensions = with vscode-extensions;
            [
              ms-python.python
              llvm-vs-code-extensions.vscode-clangd
              ms-vscode.cmake-tools
              vadimcn.vscode-lldb
              jnoortheen.nix-ide
              # rust
              rust-lang.rust-analyzer
              tamasfe.even-better-toml
              usernamehw.errorlens
              serayuzgur.crates
            ]
            ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
              {
                name = "c-cpp-compile-run";
                publisher = "danielpinto8zz6";
                version = "1.0.58";
                sha256 = "sha256-lJ40S8p+rCxUCWVWXz4IyYzW0/bFL9vN7MicuGn/IHw=";
              }
              {
                name = "asm-code-lens";
                publisher = "maziac";
                version = "2.6.0";
                sha256 = "sha256-4p3kizvEqqsMNJOhyKxJQ0rH3ePjstKLWb22BYy3yZk=";
              }
              {
                name = "slint";
                publisher = "Slint";
                version = "1.5.1";
                sha256 = "sha256-9NbSqINJXuv4xIIdhwkqVP8CgVURj0I4roUwPJ6zte0=";
              }
              {
                name = "cortex-debug";
                publisher = "marus25";
                version = "1.12.1";
                sha256 = "sha256-ioK6gwtkaAcfxn11lqpwhrpILSfft/byeEqoEtJIfM0=";
              }
              {
                name = "debug-tracker-vscode";
                publisher = "mcu-debug";
                version = "0.0.15";
                sha256 = "sha256-2u4Moixrf94vDLBQzz57dToLbqzz7OenQL6G9BMCn3I=";
              }
              {
                name = "memory-view";
                publisher = "mcu-debug";
                version = "0.0.25";
                sha256 = "sha256-Tck3MYKHJloiXChY/GbFvpBgLBzu6yFfcBd6VTpdDkc=";
              }
              {
                name = "rtos-views";
                publisher = "mcu-debug";
                version = "0.0.7";
                sha256 = "sha256-VvMAYU7KiFxwLopUrOjvhBmA3ZKz4Zu8mywXZXCEHdo=";
              }
              {
                name = "peripheral-viewer";
                publisher = "mcu-debug";
                version = "1.4.6";
                sha256 = "sha256-flWBK+ugrbgy5pEDmGQeUzk1s2sCMQJRgrS3Ku1Oiag=";
              }
              {
                name = "probe-rs-debugger";
                publisher = "probe-rs";
                version = "0.23.0";
                sha256 = "sha256-PhEJ8TuzK4PYTnFVgv9rBec1EDViEVGS1ArUweNqS7Q=";
              }
            ];
        }
      )
    ];
  };
}
