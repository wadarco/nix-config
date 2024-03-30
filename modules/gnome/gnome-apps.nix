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
        systemPackages = with pkgs.gnome; [
          nautilus
          gnome-clocks
          gnome-tweaks
          gnome-weather
          gnome-disk-utility
          gnome-software
        ] ++
        (with pkgs; [
          amberol
          celluloid
          gnome-console
          loupe
        ]);

        gnome.excludePackages = [ pkgs.gnome-tour ];
      };
    };
}
