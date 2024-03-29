{ pkgs, ... }:

{
  home.packages = [
    (pkgs.wezterm.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        rm -rf $out/share/icons
        mkdir -p $out/share/icons/hicolor/512x512/apps
        cp -r ${./desktop_icon.png} $out/share/icons/hicolor/512x512/apps/org.wezfurlong.wezterm.png
      '';
    }))
  ];
  home.file.".config/wezterm/wezterm.lua".source = ./wezterm.lua;
}
