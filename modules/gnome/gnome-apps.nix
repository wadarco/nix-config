{ lib, pkgs, config, ... }:

with lib;
let
  cfg = config.modules.gnome.apps;
in
{
  options = {
    modules.gnome.apps.enable = mkEnableOption false;
  };

  config = mkIf cfg.enable
    {
      environment = {
        systemPackages = with pkgs; [
          amberol
          celluloid
          gnome-clocks
          gnome-console
          gnome-disk-utility
          gnome-software
          gnome-tweaks
          gnome-weather
          loupe
          nautilus
        ];

        gnome.excludePackages = [ pkgs.gnome-tour ];
      };
    };
}
