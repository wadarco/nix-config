{ pkgs, ... }:

{
  home.packages = with pkgs; [ lf ];
  xdg.configFile."lf/" = {
    source = ./config;
    recursive = true;
  };
}
