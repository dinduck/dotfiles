{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.programs.yazi;
in {
  options.modules.programs.yazi = {
    enable = mkEnableOption "yazi";
    package = mkOption {
      type = lib.types.package;
      default = pkgs.yazi;
      description = "yazi package";
    };
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ffmpegthumbnailer
      unrar
      jq
      poppler
      fd
      ripgrep
      fzf
      zoxide
    ];
    programs.yazi = {
      enable = true;
      settings = {
        log = {
          enabled = false;
        };
        manager = {
          show_hidden = false;
          sort_by = "modified";
          sort_dir_first = true;
          sort_reverse = true;
        };
      };
    };
  };
}
