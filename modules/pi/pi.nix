{
  flake-file = {
    inputs = {
      nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/develop";
    };

    nixConfig = {
      extra-substituters = [
        "https://nixos-raspberrypi.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
      ];
    };
  };
}
