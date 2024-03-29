{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.gnome;
in
{
  options = {
    modules.gnome.enable = mkEnableOption false;
  };

  config = mkMerge [
    (mkIf cfg.enable
      {
        services = {
          xserver = {
            enable = true;
            displayManager.gdm.enable = true;
            desktopManager.gnome.enable = true;
          };

          gnome.core-utilities.enable = false;
          xserver.excludePackages = [ pkgs.xterm ];
        };
        environment.systemPackages = with pkgs; [ gnomeExtensions.appindicator ];
      })

    (mkIf config.services.pipewire.enable {
      hardware.pulseaudio.enable = false;
    })
  ];

}
