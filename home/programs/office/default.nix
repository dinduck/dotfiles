{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.programs.office;
in
{
    options.modules.programs.office = {
      wpsoffice = {
        enable = mkEnableOption "WPS";
        package = mkOption {
          type = types.package;
          default = pkgs.wpsoffice;
          defaultText = literalExpression "pkgs.wpsoffice";
          example = literalExpression "pkgs.wpsoffice-cn";
          description = ''
          Version of wpsoffice to install.
        '';
        };
      };
      libreoffice = {
        enable = mkEnableOption "Libreoffice";
        package = mkOption {
          type = types.package;
          default = pkgs.libreoffice;
          defaultText = literalExpression "pkgs.libreoffice";
          example = literalExpression "pkgs.libreoffice-fresh";
          description = ''
          Version of Libreoffice to install.
        '';
        };
      };
    };
    
    config = mkIf cfg.libreoffice.enable {
      home.packages = [ cfg.libreoffice.package ];
    };

}