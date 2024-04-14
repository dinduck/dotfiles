{...}: {
  imports = [
    ./hardwares
    ./boot.nix
    ./programs
    ./services/udev.nix
  ];
}
