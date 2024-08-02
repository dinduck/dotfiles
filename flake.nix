{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nixvim.url = "github:luckycyang/nixvim";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    my-nur = {
      url = "github:luckycyang/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    git-hosts = {
      url = "https://gitlab.com/ineo6/hosts/-/raw/master/hosts?ref_type=heads";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixpkgs-wayland,
    home-manager,
    nur,
    git-hosts,
    ...
  } @ inputs: {
    nixosConfigurations.luckynix = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowBroken = true;
          config.allowUnfree = true;
          config.nvidia.acceptLicense = true;
        };
        inherit git-hosts;
      };
      modules = [
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.dingduck = import ./home/home.nix;
          home-manager.extraSpecialArgs = inputs;
        }
      ];
    };
  };
}
