{
  lib,
  config,
  ...
}: let
  cfg = config.modules.hardwares.bluetooth;
in {
  options.modules.hardwares.bluetooth = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable Bluetooth";
    };
  };
  config = lib.mkIf cfg.enable {
    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    services.blueman.enable = true;
  };
}
