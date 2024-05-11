{ pkgs-stable, ... }:

{
  programs.kitty = {
    font = {
      name = "Lilex Nerd Font Mono Medium";
      size = 14;
    };
    theme = "Catppuccin-Mocha";
    settings = {
      cursor_shape = "beam";
      disable_ligatures = "never";
      tab_bar_style = "fade";
      hide_window_decorations = "yes";
      background_opacity = "0.95";
      window_padding_width = "6";
      map = "ctrl+shift+enter launch --cwd=current";
    };
    package = pkgs-stable.kitty.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        rm -rf $out/share/icons
        mkdir -p $out/share/icons/hicolor/512x512/apps
        cp -r ${./desktop_icon.png} $out/share/icons/hicolor/512x512/apps/kitty.png
      '';
    });
    enable = true;
  };
}
