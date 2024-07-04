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
          gnome-software
          gnome-weather
        ] ++
        (with pkgs; [
          amberol
          celluloid
          gnome-console
          loupe
          gnome-disk-utility
          gnome-tweaks
          nautilus

        ]);

        gnome.excludePackages = [ pkgs.gnome-tour ];
      };
    };
}
