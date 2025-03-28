{
  description = "Horrible beyond anything you can imagine — but wonderful.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    ghostty.url = "github:ghostty-org/ghostty";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ghostty,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (self: super: { ghostty = ghostty.packages.${system}.default; })
        ];
      };
      lib = pkgs.lib.extend (
        self: super:
        (import ./lib {
          inherit pkgs;
          lib = self;
        })
      );
    in
    {
      lib = lib;

      nixosModules.default =
        { pkgs, lib, ... }:
        {
          imports = lib.importModules ./modules;
        };

      nixosConfigurations.apocrypha = nixpkgs.lib.nixosSystem {
        inherit system pkgs lib;
        specialArgs = { inherit (inputs) home-manager ghostty; };
        modules = [
          self.nixosModules.default
          ./hosts/apocrypha
          {
            home-manager.extraSpecialArgs = { };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
      };
      formatter.${system} = pkgs.nixfmt-rfc-style;
    };

}
