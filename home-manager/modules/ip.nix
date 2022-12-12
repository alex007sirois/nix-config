{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      doggo
      iputils
      rustscan
    ];
}
