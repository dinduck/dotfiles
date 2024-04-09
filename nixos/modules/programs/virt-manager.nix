{
  pkgs-unstable,
  lib,
  config,
  ...
}: let
  pkgs = pkgs-unstable;
  cfg = config.modules.programs.virt-manager;
in {
  options.modules.programs.virt-manager = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Virt-Mnager for kvm";
    };
  };
  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    users.users.dingduck.extraGroups = ["libvirtd"];
  };
}
