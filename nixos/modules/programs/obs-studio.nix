{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.programs.obs-studio;
in {
  options.modules.programs.obs-studio = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable obs";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      })
    ];
    boot.extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    boot.extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    security.polkit.enable = true;
  };
}
