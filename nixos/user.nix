{...}: {
  imports = [./modules];
  modules = {
    hardwares = {
      gpu.enable = true;
      bluetooth.enable = true;
    };
    boot.enable = true;
    programs = {
      vscode.enable = true;
      steam.enable = true;
      virt-manager.enable = true;
      obs-studio.enable = true;
      podman.enable = true;
    };
    services = {
      udev.enable = true;
    };
  };
}
