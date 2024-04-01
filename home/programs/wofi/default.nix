{ config, lib, ...}:
with lib;
let 
cfg = config.modules.programs.wofi;
in
{
  options.modules.programs.wofi = {
    enable = mkEnableOption "Wofi";
  };
  config = mkIf cfg.enable {
      programs.wofi = {
    enable = true;
    settings = {
      location = "center";
      allow_images = true;
    };
  };
  xdg.configFile.".config/style.css".source = ./style.css;
  };
}