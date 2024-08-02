{
  my-nur,
  pkgs,
  nixpkgs-unstable,
  nixvim,
  ...
}: let
  pkgs-unstable = import nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in {
  imports = [
    ./user.nix
  ];
  home.username = "dingduck";
  home.homeDirectory = "/home/dingduck";

  home.packages = with pkgs;
    [
      neofetch
      devenv
      yazi

      # browser
      
      vlc
      element-desktop
      slack

      yesplaymusic
      jellyfin-media-player

      # archives
      zip
      xz
      unzip
      p7zip

      # utils
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      eza # A modern replacement for ‘ls’
      networkmanagerapplet
      pavucontrol

      # nixvim
      nixvim.packages.${pkgs.system}.default

      btop # replacement of htop/nmon
      iotop # io monitoring
      iftop # network monitoring

      # fonts
      wqy_zenhei
      jetbrains-mono
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      iosevka
      # nerd c
      powerline-fonts
      material-design-icons
      martian-mono
      font-awesome
      weather-icons
      source-code-pro
      fira-code-nerdfont
    ]
    ++ (with pkgs-unstable; [
      google-chrome
      brave
      kicad
      notion-app-enhanced
      gtkwave
      android-studio
      android-tools
      termius
      bottles
      postman
      stm32cubemx
      qq
      obsidian
      distrobox
      telegram-desktop
      jetbrains-toolbox
      logisim-evolution
      verilator
    ])
    ++ [
      my-nur.packages."${pkgs.system}".probe-rs
      my-nur.packages."${pkgs.system}".wemeet
    ];
  # git 相关配置
  programs.git = {
    enable = true;
    userName = "Ding Duck";
    userEmail = "kfove.liang@gmail.com";
  };

  services.network-manager-applet.enable = true;

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
