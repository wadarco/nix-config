{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.gnome;
in
{
  options = {
    modules.gnome.enable = mkEnableOption false;
  };

  config = mkIf cfg.enable {
    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      gnome.core-apps.enable = false;
    };
    environment.systemPackages = with pkgs; [ gnomeExtensions.appindicator ];
  };
}
