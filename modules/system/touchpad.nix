{
  flake.modules.nixos.system = {
    services.libinput.enable = true;
  };
}
