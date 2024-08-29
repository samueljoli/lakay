{ inputs, pkgs, ... }:

{
  home-manager = {
    enable = true;
  };

  git = import ./git.nix { inherit pkgs; };

  direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    config = {
      hide_env_diff = true;
    };
  };

  neovim = import ./neovim/default.nix {
    inherit pkgs;
    inherit inputs;
  };

  starship = import ./starship.nix { inherit pkgs; };

  zsh = import ./zsh/default.nix { inherit pkgs; };

  zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
