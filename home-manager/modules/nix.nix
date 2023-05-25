{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    nil
  ];
  programs.nix-index.enable = true;
  programs.helix.languages.language = [
    {
      name = "nix";
      formatter = {
        command = "alejandra";
        args = ["--quiet" "-"];
      };
    }
  ];
}
