{lib, ...}:
lib.extend (
  self: super: let
    lib = super;
    find = import ./find.nix {inherit lib;};
  in {inherit find;}
)
