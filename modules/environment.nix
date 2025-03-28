{ pkgs, ... }:
{
  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    defaultPackages = [ ];

    systemPackages = with pkgs; [
      bat
      ffmpeg
      file
      flac
      lf
      libwebp
      nil
      nixfmt-rfc-style
      unrar
      unzip
      wineWowPackages.staging
      ghostty
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

      # LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath [pkgs.vulkan-loader]}";
    };

    shellAliases = {
      cat = "${pkgs.bat}/bin/bat";
      ls = "${pkgs.lsd}/bin/lsd";
    };
  };
}
