{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.programs.helix;
in {
  options.modules.programs.helix = {
    enable = mkEnableOption "helix";
  };
  config = mkIf cfg.enable {
    programs.helix = {
      enable = true;
      extraPackages = with pkgs; [
        metals
        nil
        nodePackages_latest.typescript-language-server
        markdown-oxide
        rust-analyzer
        slint-lsp
        rocmPackages.llvm.clang-tools-extra # cland 在工具包里面
        dockerfile-language-server-nodejs
        docker-compose-language-service
        yaml-language-server
        cmake-language-server
      ];
      settings = {
        theme = "catppuccin_macchiato";
        editor = {
          line-number = "absolute";
          lsp.display-messages = true;
          lsp.display-inlay-hints = true;
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "block";
          };
        };
        keys.normal = {
          space.space = "file_picker";
          space.w = ":w";
          space.q = ":q";
          esc = ["collapse_selection" "keep_primary_selection"];
        };
      };
    };
  };
}
