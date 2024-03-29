{ pkgs, ... }:

{
  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    defaultPackages = [ ];

    systemPackages = with pkgs;[
      nixpkgs-fmt
      nil
      wget
      unzip
      unrar
      tree
      bat
      lf
      ffmpeg
      flac
      libwebp
      wineWowPackages.staging
    ];

    sessionVariables = {
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      XCOMPOSEFILE = "$XDG_CONFIG_HOME/X11/xcompose";
      XCOMPOSECACHE = "$XDG_CACHE_HOME/X11/xcompose";

      HISTFILE = "$XDG_CACHE_HOME/bash_history";
      GNUPGHOME = "$XDG_DATA_HOME/gnupg"; # Ensure permissions by running `chmod 700 $XDG_DATA_HOME/gnupg`
      WINEPREFIX = "$XDG_DATA_HOME/wineprefixes/default";
    };

    shellAliases = {
      cat = "${pkgs.bat}/bin/bat";
      ls = "${pkgs.lsd}/bin/lsd";
    };
  };
}
