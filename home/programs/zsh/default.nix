{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "exa -l";
      update = "sudo nixos-rebuild switch";
    };
    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
        {name = "zsh-users/zsh-syntax-highlighting";}
        {
          name = "zsh-users/zsh-history-substring-search";
          tags = [as:plugin];
        }
        {
          name = "MAHcodes/distro-prompt";
          tags = [as:theme depth:1];
        }
        {name = "zap-zsh/supercharge";}
        {name = "zap-zsh/exa";}
      ];
    };
  };
}
