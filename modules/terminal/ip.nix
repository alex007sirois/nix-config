{
  flake.modules.homeManager.terminal = {pkgs, ...}: {
    home.packages = with pkgs; [
      doggo
      iputils
      rustscan
    ];
  };
}
