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
            ];
        }
      )
    ];
  };
}
