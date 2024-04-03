{
  config,
  pkgs-unstable,
  lib,
  ...
}: let
  pkgs = pkgs-unstable;
  cfg = config.modules.boot;
in {
  options.modules.boot = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "my boot options";
    };
  };
  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_zen; # zen 内核值得信赖
    services.gvfs.enable = true; # 主要给thunar提供服务
    boot.supportedFilesystems = ["ntfs"]; # ntfs 支持
  };
}
