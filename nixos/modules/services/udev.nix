{
  lib,
  config,
  ...
}: let
  cfg = config.modules.services.udev;
in {
  options.modules.services.udev = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable obs";
    };
  };
  config = lib.mkIf cfg.enable {
    services.udev = {
      enable = true;
      extraRules = ''
        # CMSIS DAP
        ATTRS{idVendor}=="0d28", ATTRS{idProduct}=="0204", MODE="664", GROUP="plugdev", TAG+="uaccess"
        # WCH-Link
        ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="8010", MODE="664", GROUP="plugdev", TAG+="uaccess
        # OpenMV
        ATTRS{idVendor}=="1209", ATTRS{idProduct}=="abd1", MODE="664", GROUP="plugdev", TAG+="uaccess

      '';
    };
  };
}
