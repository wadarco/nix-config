{
  lib,
  config,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.modules.development.zig;
in
{
  options.modules.development.zig = {
    enable = mkEnableOption "zig";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      zig
      zls
    ];
  };
}
