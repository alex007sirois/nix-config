{
  flake.modules = {
    nixos.budget = {
      services.actual = {
        enable = true;
        openFirewall = true;
      };
    };
    homeManager.budget = { pkgs, ... }: {
      home.packages = with pkgs; [
        actual-client
      ];
    };
  };
}
