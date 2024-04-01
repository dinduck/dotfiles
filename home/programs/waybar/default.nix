{ config, lib, pkgs, ...}:
with lib;
let
cfg = config.modules.programs.waybar;
in
{
  options.modules.programs.waybar = { enable = mkEnableOption "Waybar"; };
  config = mkIf cfg.enable {
    xdg.configFile."waybar/style.css".source = ./style.css;
    xdg.configFile."waybar/config".source = ./config;
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
    };
  };
}