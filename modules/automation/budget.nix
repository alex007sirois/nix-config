{
  flake.modules = {
    # TODO change category
    nixos.terminal = {
      services.actual = {
        enable = true;
        openFirewall = true;
      };
    };
    # TODO change category
    homeManager.terminal = { pkgs, ... }: {

      home.packages = with pkgs; [
        actual-client
      ];
    };
  };
}
