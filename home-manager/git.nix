{ pkgs }:

{
  enable = true;
  userName = "Samuel Joli";
  userEmail = "samuel.joli.ftn@gmail.com";
  aliases = (import ./aliases.nix { inherit pkgs; }).git;
  delta = {
    enable = true;
  };
  extraConfig = {
    core = {
      editor = "nvim";
      whitespace = "trailing-space,space-before-tab";
    };
    # commit.gpgsign = "true";
    init.defaultBranch = "main";
    protocol.keybase.allow = "always";
    pull.rebase = "false";
    push.autoSetupBranch = "true";
    # user = { signingkey = "1BF86B7AE4343C5F"; };
  };
  ignores = [
    ".cache/"
    ".DS_Store"
    ".direnv/"
    ".idea/"
    "*.swp"
    "npm-debug.log"
  ];
  lfs = {
    enable = true;
  };
  package = pkgs.gitAndTools.gitFull;
}
