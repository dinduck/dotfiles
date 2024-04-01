{ pkgs, lib, config, ... }:
with lib;
let
cfg = config.modules.dconf;
in
{
  options.modules.dconf = {
      virt-manager = {
        enable = mkEnableOption "virt-manager";
      };
  };
  config = mkIf cfg.virt-manager.enable {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };
  };
}