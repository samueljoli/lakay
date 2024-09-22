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
    plugin-vim-kitty = {
      url = "github:knubie/vim-kitty-navigator/20abf8613aa228a5def1ae02cd9da0f2d210352a";
      flake = false;
    };
    plugin-statuscolumn-nvim = {
      url = "github:JuanBaut/statuscolumn.nvim";
      flake = false;
    };
    plugin-tint-nvim = {
      url = "github:levouh/tint.nvim";
      flake = false;
    };
    plugin-cyberpunk-nvim = {
      url = "github:samueljoli/cyberpunk.nvim";
      flake = false;
    };
    plugin-grug-nvim = {
      url = "github:MagicDuck/grug-far.nvim";
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
