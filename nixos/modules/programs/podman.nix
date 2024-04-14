{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.programs.podman;
in {
  options.modules.programs.podman = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable Podman";
    };
  };
  config = lib.mkIf cfg.enable {
    virtualisation.containers.enable = true;
    virtualisation = {
      podman = {
        enable = true;
        enableNvidia = true;

        # Create a `docker` alias for podman, to use it as a drop-in replacement
        dockerCompat = true;

        # Required for containers under podman-compose to be able to talk to each other.
        defaultNetwork.settings.dns_enabled = true;
      };
    };
    environment.systemPackages = with pkgs; [
      dive # look into docker image layers
      podman-tui # status of containers in the terminal
      docker-compose # start group of containers for dev
      #podman-compose # start group of containers for dev
    ];
  };
}
