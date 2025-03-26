{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../users/raden.nix
  ];

  networking = {
    hostName = "apocrypha";
    networkmanager.enable = true;
  };

  time.timeZone = "America/New_York";

  modules = {
    development = {
      zig.enable = true;
      rust.enable = true;
      haskell.enable = true;
      javascript.enable = true;
    };

    gnome = {
      enable = true;
      apps.enable = true;
    };
  };

  programs = {
    fish.enable = true;
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraPkgs = pkgs: [ ];
      };
    };
    nano.enable = false;

    neovim = {
      enable = true;
      defaultEditor = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    use-xdg-base-directories = true;
  };

  system.stateVersion = "24.05";
}
