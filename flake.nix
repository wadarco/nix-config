{
  description = "Horrible beyond anything you can imagine — but wonderful.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      pkgs-stable = import nixpkgs-stable { inherit system; };
      lib = pkgs.lib.extend
        (self: super:
          (import ./lib { inherit pkgs; lib = self; }));
    in
    {
      lib = lib;

      nixosModules.default = { pkgs, lib, ... }: {
        imports = lib.importModules ./modules;
      };

      nixosConfigurations.apocrypha = nixpkgs.lib.nixosSystem {
        inherit system pkgs lib;
        specialArgs = {
          inherit (inputs) home-manager;
          inherit pkgs-stable;
        };
        modules = [
          self.nixosModules.default
          ./hosts/apocrypha
          {
            home-manager.extraSpecialArgs = { inherit pkgs-stable; };
            home-manager. useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
      };
    };

}
