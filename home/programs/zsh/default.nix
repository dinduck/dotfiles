{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.programs.zsh;
in {
  options.modules.programs.zsh = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "my zsh config";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      shellAliases = {
        ll = "exa -l";
        update = "sudo nixos-rebuild switch --flake .";
      };
      zplug = {
        enable = true;
        plugins = [
          {name = "zsh-users/zsh-autosuggestions";}
          {name = "zsh-users/zsh-syntax-highlighting";}
          {name = "zap-zsh/completions";}
          {name = "Aloxaf/fzf-tab";}
          {name = "Freed-Wu/fzf-tab-source";}
          {name = "nix-community/nix-zsh-completions";}
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
  };
}
