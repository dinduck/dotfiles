{...}: {
  imports = [./modules];
  modules = {
    hardwares = {
      gpu.enable = true;
    };
    boot.enable = true;
  };
}
