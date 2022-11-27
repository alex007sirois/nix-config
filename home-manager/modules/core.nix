{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      coreutils-full
      # TODO remove prefix and replace 'coreutils-full' once stable enough
      (uutils-coreutils.override { prefix = "uutils-"; })
    ];
}
