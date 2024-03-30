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
          gnome-clocks
          gnome-disk-utility
          gnome-software
          gnome-tweaks
          gnome-weather
          nautilus
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
