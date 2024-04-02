{...}: {
  imports = [./modules];
  modules = {
    hardwares = {
      gpu.enable = true;
    };
    boot.enable = true;
    programs = {
      vscode.enable = true;
    };
  };
}
