{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.modules.development.haskell;
in
{
  options.modules.development.haskell = {
    enable = mkEnableOption "haskell";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cabal-install
      ghc
      haskell-language-server
    ];
  };
}
