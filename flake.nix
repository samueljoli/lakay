{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plugin-cyberpunk-nvim = {
      url = "github:samueljoli/cyberpunk.nvim";
      flake = false;
    };
    plugin-gruvbox-nvim = {
      url = "github:ellisonleao/gruvbox.nvim";
      flake = false;
    };
    plugin-yazi-nvim = {
      url = "github:mikavilpas/yazi.nvim";
      flake = false;
    };
    plugin-heirline-components = {
      url = "github:Zeioth/heirline-components.nvim/f849bbfe05f0d523449eb8d0713dffd4c3d7c295";
      flake = false;
    };
    plugin-lazydev-nvim = {
      url = "github:folke/lazydev.nvim";
      flake = false;
    };
    plugin-luvit-meta = {
      url = "github:Bilal2453/luvit-meta";
      flake = false;
    };
    plugin-dir-telescope = {
      url = "github:princejoogie/dir-telescope.nvim";
      flake = false;
    };
    baouncer = {
      url = "github:lalilul3lo/baouncer";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        inherit (pkgs) lib;
      in
      {
        packages = {
          formatter = pkgs.nixfmt-rfc-style;
          default = home-manager.defaultPackage.${system};
          homeConfigurations = {
            "sjoli" = home-manager.lib.homeManagerConfiguration {
              pkgs = pkgs;

              modules = [ ./home-manager/default.nix ];

              extraSpecialArgs = {
                inherit inputs;
                inherit system;
              };
            };
          };
        };
        formatter = pkgs.nixfmt-rfc-style;
        devShells.default = pkgs.mkShell { packages = with pkgs; [ lua-language-server ]; };
      }
    );
}
