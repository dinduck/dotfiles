{
  config,
  pkgs-unstable,
  lib,
  ...
}: let
  pkgs = pkgs-unstable;
  cfg = config.modules.hardwares.gpu;
in
  with lib; {
    options.modules.hardwares.gpu = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = "disable/enable gpu for r7000";
      };
    };
    config = mkIf cfg.enable {
      boot.initrd.kernelModules = ["amdgpu"];
      services.xserver.videoDrivers = ["amdgpu" "nvidia"];
      hardware.bluetooth.enable = true; # enables support for Bluetooth
      hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
      hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
        extraPackages = with pkgs; [
          rocmPackages.clr.icd
          amdvlk
        ];
        extraPackages32 = with pkgs; [
          driversi686Linux.amdvlk
        ];
      };

      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        prime = {
          nvidiaBusId = "PCI:1:0:0";
          amdgpuBusId = "PCI:6:0:0";
        };
      };
    };
  }
