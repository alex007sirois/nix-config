{
  flake.modules.nixos.system = {
    hardware.bluetooth.settings = {
      General = {
        Experimental = true;
      };
    };
  };
}
