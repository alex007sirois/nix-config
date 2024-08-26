{...}: final: prev: {
  gnome = prev.gnome.overrideScope (gfinal: gprev: {inherit (final) gnome-backgrounds;});
}
