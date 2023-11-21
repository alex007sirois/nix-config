{
  pkgs,
  lib,
  ...
}: let
  pistol-preview = "--preview 'pistol {}'";
  open-bind = "--bind 'ctrl-o:execute-silent(xdg-open {})'";
  edit-bind = "--bind 'ctrl-e:execute($EDITOR {})'";
  yank-bind = "--bind 'ctrl-y:execute-silent(echo -n {} | xclip -sel clip)'";
  history-yank-bind = "--bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -sel clip)'";
in {
  home.packages = with pkgs; [
    eza
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
    fileWidgetOptions = [
      pistol-preview
      yank-bind
      edit-bind
      open-bind
    ];
    changeDirWidgetCommand = "fd --follow --type directory";
    changeDirWidgetOptions = [
      pistol-preview
      yank-bind
      open-bind
    ];
    historyWidgetOptions = [
      history-yank-bind
    ];
  };

  home.shellAliases = {
    fzf = lib.strings.concatStringsSep " " [
      "fzf"
      yank-bind
    ];
    fzf-file = lib.strings.concatStringsSep " " [
      "fzf"
      pistol-preview
      edit-bind
      open-bind
    ];
  };

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
}
