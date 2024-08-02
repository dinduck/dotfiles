
{ config, lib, ...}:
with lib;
let 
cfg = config.modules.programs.mako;
in
{
  options.modules.programs.mako = {
    enable = mkEnableOption "Mako notice in Wayland";
  };
  config = mkIf cfg.enable {
    services.mako = {
    enable = true;
  
  };
  
  };
}
