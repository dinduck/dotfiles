{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.programs.starship;
in {
  options.modules.programs.starship = {enable = mkEnableOption "Starship for bash";};
  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
    };
  };
}
