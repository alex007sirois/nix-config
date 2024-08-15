{pkgs, ...}: {
  home.packages = with pkgs; [
    eza
    bat
    chafa
    fd
    ffmpeg-full
    file
    hexyl
    lnav
    openssl
    pandoc
    pdfminer
  ];

  programs.pistol = {
    enable = true;
    associations = [
      {
        mime = "inode/directory";
        command = "eza --classify --group-directories-first --icons --time-style=long-iso --git %pistol-filename%";
      }
      {
        mime = "application/x-x509-ca-cert";
        command = "openssl x509 -text -noout -passin pass: -in %pistol-filename%";
      }
      {
        fpath = ".*\.pem$";
        command = "sh: openssl x509 -text -noout -passin pass: -in %pistol-filename% || bat --paging=never %pistol-filename%";
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

  home.shellAliases = {
    bat = "bat -p";
    batf = "bat --style=full";
  };
}
