{
  flake.modules =
    let
      user.email = "asirois@dimonoff.com";
    in
    {
      homeManager.work = { inherit user; };
      nixos.work = { inherit user; };
    };
}
