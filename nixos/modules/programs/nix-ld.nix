{
  pkgs-unstable,
  lib,
  config,
  ...
}: let
  pkgs = pkgs-unstable;
  cfg = config.modules.programs.nix-ld;
in {
  options.modules.programs.nix-ld = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable nix-ld for run somthing";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
      ];
    };
  };
}
