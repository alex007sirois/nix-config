{
  flake.modules = {
    homeManager.virtualisation = {pkgs, ...}: {
      home.packages = with pkgs; [
        dive
        lazydocker
      ];
    };
    nixos.virtualisation = {pkgs, ...}: let
      docker-enable-qemu =
        pkgs.writeShellScriptBin
        "docker-enable-qemu"
        "${pkgs.docker}/bin/docker run --privileged --rm tonistiigi/binfmt --install all";
    in {
      user.groups = ["docker"];
      virtualisation.docker = {
        enable = true;
        autoPrune.enable = true;
      };
      environment.systemPackages = [docker-enable-qemu];
    };
  };
}
