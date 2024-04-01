{
  config,
  pkgs,
  nixvim,
  ...
}: {
  imports = [
    ./user.nix
  ];
  home.username = "dingduck";
  home.homeDirectory = "/home/dingduck";

  home.packages = with pkgs; [
    neofetch
    yazi

    # archives
    zip
    busybox
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
