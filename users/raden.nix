{
  pkgs,
  home-manager,
  lib,
  ...
}: {
  imports = [
    home-manager.nixosModules.default
  ];

  users.users.raden = {
    description = "無名";
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "audio" "networkmanager" ];
  };

  home-manager.users.raden = {
    imports = lib.importModules ../home;
    home-modules.wezterm.enable = true;

    xdg.enable = true;
    home.stateVersion = "24.05";
    programs.git = {
      enable = true;
      userName = "Nyarlathotep";
      userEmail = "anhedonia@skiff.com";
      signing = {
        key = null;
        signByDefault = true;
      };
      extraConfig = { core.editor = "hx"; };
    };
  };
}
