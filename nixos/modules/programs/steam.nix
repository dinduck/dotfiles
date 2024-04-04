{
  pkgs-unstable,
  lib,
  config,
  ...
}: let
  pkgs = pkgs-unstable;
  cfg = config.modules.programs.steam;
in {
  options.modules.programs.steam = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable Steam";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      package = pkgs.steam;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
    hardware.steam-hardware.enable = true;
  };
}
