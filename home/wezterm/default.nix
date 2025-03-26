{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  cfg = config.home-modules.wezterm;
in
{
  options.home-modules.wezterm = {
    enable = mkEnableOption "wezterm";
  };

  config = mkIf cfg.enable {
    home.packages = [
      (pkgs.wezterm.overrideAttrs (oldAttrs: {
        postInstall =
          (oldAttrs.postInstall or "")
          + ''
            rm -rf $out/share/icons
            mkdir -p $out/share/icons/hicolor/512x512/apps
            cp -r ${./desktop_icon.png} $out/share/icons/hicolor/512x512/apps/org.wezfurlong.wezterm.png
          '';
      }))
    ];
    home.file.".config/wezterm/wezterm.lua".source = ./wezterm.lua;
  };
}
