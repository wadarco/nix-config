{ pkgs, ... }:

{
  home.packages = with pkgs;[ lf ];
  xdg.configFile."lf".source = ./source;
}
