{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
      url = "github:Zeioth/heirline-components.nvim";
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
    baouncer = {
      url = "github:lalilul3lo/baouncer";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    {

      defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

      homeConfigurations = {
        "sjoli" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "aarch64-darwin"; };

          modules = [ ./home-manager/default.nix ];

          extraSpecialArgs = {
            inherit inputs;
          };
        };
      };
    };
}
