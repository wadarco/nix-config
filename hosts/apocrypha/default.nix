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

  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      stdenv.cc.cc.lib
      zlib
      zstd
      curl
    ];
  };
  virtualisation.waydroid.enable = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    use-xdg-base-directories = true;
  };

  system.stateVersion = "25.05";
}
