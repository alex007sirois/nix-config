{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    comma
    nil
  ];
  programs.nix-index.enable = true;
  programs.helix.languages = [
    {
      name = "nix";
      formatter = {
        command = "alejandra";
        args = ["--quiet" "-"];
      };
    }
  ];
}
