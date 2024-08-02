{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.programs.alacritty;
in {
  options.modules.programs.alacritty = {
    enable = mkEnableOption "Alacritty";
  };
  config = mkIf cfg.enable {
    xdg.configFile."alacritty/alacritty.toml".source = ./alacritty.toml;
  };
}
