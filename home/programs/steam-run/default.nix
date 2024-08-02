{
  nixpkgs-unstable,
  lib,
  pkgs,
  config,
  ...
}: let
  overlays = [
    (self: super: {
      steam-run =
        (super.steam.override {
          extraLibraries = pkgs:
            with pkgs; [
              libxkbcommon
              mesa
              wayland
              (sndio.overrideAttrs (old: {
                postFixup =
                  old.postFixup
                  + ''
                    ln -s $out/lib/libsndio.so $out/lib/libsndio.so.6.1
                  '';
              }))
            ];
        })
        .run;
    })
  ];
  cfg = config.modules.programs.steam-run;
  pkgs-unstable = import nixpkgs-unstable {
    system = "x86_64-linux";
    overlays = overlays;
  }; # where you can replace
in {
  options.modules.programs.steam-run = {enable = lib.mkEnableOption "hyprland";};
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      steam-run
    ];
  };
}
