{pkgs, ...}: {
  home.packages = with pkgs; [
    exa
    bat
    chafa
    fd
    ffmpeg_5-full
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

  home.shellAliases = {
    fzf = "fzf --preview 'pistol {}'";
  };

  programs.pistol = {
    enable = true;
    associations = [
      {
        mime = "inode/directory";
        command = "exa --classify --group-directories-first --icons --time-style=long-iso %pistol-filename%";
      }
      {
        mime = "application/x-x509-ca-cert";
        command = "openssl x509 -text -noout -passin pass: -in %pistol-filename%";
      }
      {
        fpath = ".*\.pem$";
        command = "sh: openssl x509 -text -noout -passin pass: -in %pistol-filename% || bat %pistol-filename%";
      }
      {
        mime = "application/pdf";
        command = "pdf2txt --maxpages 2 %pistol-filename%";
      }
      {
        mime = "application/epub";
        command = "pandoc -t plain %pistol-filename%";
      }
      {
        mime = "application/vnd.*document*";
        command = "pandoc -t plain %pistol-filename%";
      }
      {
        mime = "text/html";
        command = "pandoc -t plain %pistol-filename%";
      }
      {
        mime = "text/x-tex";
        command = "pandoc -t plain %pistol-filename%";
      }
      {
        mime = "application/json";
        command = "bat --paging=never --color=always %pistol-filename%";
      }
      {
        fpath = ".*\.log(.\d\w+)?(.gz)?$";
        command = "lnav -n %pistol-filename%";
      }
      {
        mime = "text/*";
        command = "bat --paging=never --color=always %pistol-filename%";
      }
      {
        fpath = ".*\.done$";
        command = "file -bi %pistol-filename%";
      }
      {
        mime = "image/*";
        command = "chafa %pistol-filename%";
      }
      {
        mime = "audio/*";
        command = "ffprobe -hide_banner  %pistol-filename%";
      }
      {
        mime = "video/*";
        command = "ffprobe -hide_banner  %pistol-filename%";
      }
      {
        mime = "application/*";
        command = "hexyl %pistol-filename%";
      }
    ];
  };
}
