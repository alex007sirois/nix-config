{ lib, ... }:
let
  inherit (lib) mkOption types;

  userOptions = {
    name = mkOption {
      type = types.str;
      default = "Alex Sirois";
    };
    username = mkOption {
      type = types.str;
      default = "alex";
    };
    email = mkOption {
      type = types.str;
      default = "alex007sirois@gmail.com";
    };
  };
  nixosUserOptions = userOptions // {
    groups = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };
  };
in
{
  flake.modules = {
    homeManager.users.options.user = userOptions;
    nixos.users.options.user = nixosUserOptions;
  };
}
