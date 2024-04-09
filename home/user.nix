{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./programs
    ./themes
    ./dconf
  ];
  config.modules = {
    programs = {
      hyprland.enable = true;
      alacritty.enable = true;
      waybar.enable = true;
      wofi.enable = true;
      aria2.enable = false;
      office.libreoffice.enable = true;
      yazi.enable = true;
      zsh.enable = true;
    };
    themes = {
      nordic.enable = true;
    };
    dconf = {
      virt-manager.enable = true;
    };
  };
}
