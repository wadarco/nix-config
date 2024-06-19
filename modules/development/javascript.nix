{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.development.javascript;
in
{
  options.modules.development.javascript = {
    enable = mkEnableOption "javascript";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        bun
        deno
        nodejs_latest
        pnpm
        yarn
      ];

      sessionVariables = {
        NODE_REPL_HISTORY = "$XDG_CACHE_HOME/repl_history";
        NPM_CONFIG_CACHE = "$XDG_CACHE_HOME/npm";
        NPM_CONFIG_PREFIX = "$XDG_CONFIG_HOME/npm";
        NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/config";
        yarn = "yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config";
        # BUN_INSTALL = "$XDG_DATA_HOME/bun"; Bun will prioritize using $XDG_CONFIG_HOME, $XDG_CACHE_HOME and $XDG_DATA_HOME
      };
    };

  };
}
