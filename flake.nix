{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, vscode-server, ... }@inputs: {

    nixosConfigurations = {
      # nyx (virtual box)
      nyx = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nyx

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.wilace = import ./nyx/home.nix;
          }
        ];
      };

      # hemera (wsl)
      hemera = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hemera

          nixos-wsl.nixosModules.default

          vscode-server.nixosModules.default
          ({ config, pkgs, ... }: {
            services.vscode-server.enable = true;
          })

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.nixos = import ./hemera/home.nix;
          }
        ];
      };
    };
  };
}
