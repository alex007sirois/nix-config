{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      aria
    ];
}
