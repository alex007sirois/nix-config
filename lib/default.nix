{lib, ...}:
lib.extend (
  final: prev: let
    lib = prev;
    find = import ./find.nix {inherit lib;};
  in {inherit find;}
)
