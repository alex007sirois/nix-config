{ pkgs
, ...
}: {
  home.packages = with pkgs;
    [
      exa
      bat
      chafa
      fd
      ffmpeg
      file
      hexyl
      lnav
      openssl
      pandoc
      pdfminer
    ];

  programs.fzf = {
    enable = true;
    defaultCommand = "fd --follow";
    fileWidgetCommand = "fd --follow --type file";
    changeDirWidgetCommand = "fd --follow --type directory";
  };

  programs.pistol = {
    enable = true;
    config = {
      "application/json" = "bat --paging=never --color=always %pistol-filename%";
      "application/pdf" = "pdf2txt --maxpages 2 %pistol-filename%";
      "application/x-x509-ca-cert" = "openssl x509 -text -noout -passin pass: -in %pistol-filename%";
      "application/epub" = "pandoc -t plain %pistol-filename%";
      "application/vnd.*document*" = "pandoc -t plain %pistol-filename%";
      # FIXME https://github.com/nix-community/home-manager/issues/3486
      # "application/*" = "hexyl %pistol-filename%";
      "fpath .*\.log(.\d\w+)?(.gz)?$" = "lnav -n %pistol-filename%";
      "fpath .*\.pem$" = "sh: openssl x509 -text -noout -passin pass: -in %pistol-filename% || bat %pistol-filename%";
      "fpath .*\.done$" = "file -bi %pistol-filename%";
      "audio/*" = "ffprobe -hide_banner  %pistol-filename%";
      "image/*" = "chafa %pistol-filename%";
      "inode/directory" = "exa --classify --group-directories-first --icons --time-style=long-iso %pistol-filename%";
      "text/*" = "bat --paging=never --color=always %pistol-filename%";
      "text/html" = "pandoc -t plain %pistol-filename%";
      "text/x-tex" = "pandoc -t plain %pistol-filename%";
      "video/*" = "ffprobe -hide_banner  %pistol-filename%";
    };
  };

  home.shellAliases = {
    fzf = "fzf --preview 'pistol {}'";
  };
}
