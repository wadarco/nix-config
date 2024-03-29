{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.development.rust;
in
{
  options.modules.development.rust = {
    enable = mkEnableOption "rust";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs;[
        rustup
        clang
        gcc
      ];

      sessionVariables = {
        RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
        CARGO_HOME = "$XDG_DATA_HOME/cargo";
      };

      shellAliases = {
        rs = "rustc";
        rup = "rustup";
        rca = "cargo";
      };
    };
  };

}
