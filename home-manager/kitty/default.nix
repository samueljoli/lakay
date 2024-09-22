{ pkgs }:

{
  enable = true;
  theme = "Gruvbox Dark Hard";
  shellIntegration.enableZshIntegration = true;
  extraConfig = ''
    ${builtins.readFile ./kitty.conf}
  '';
}
