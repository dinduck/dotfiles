{
  config,
  lib,
  pkgs,
  nixpkgs-unstable,
  ...
}: let
  pkgs-unstable = import nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
  imports = [
    ./programs
    ./themes
    ./dconf
    ./misc/xdg-portal.nix
  ];
  config = {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [xdg-desktop-portal-hyprland xdg-desktop-portal];
      config = {
        common.default = "*";
      };
    };
  };
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
