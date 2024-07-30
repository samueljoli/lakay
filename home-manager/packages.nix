{ pkgs }:

let
  gitTools = (with pkgs; [
    difftastic
  ] ++ (with gitAndTools; [
    diff-so-fancy
    git-codeowners
  ]));

  infraTools = with pkgs; [
    awscli2
    tailscale
  ];

  nixTools = with pkgs; [
    devenv
    fh
    flake-checker
    nixfmt
    nixpkgs-fmt
  ];

  toys = with pkgs; [
    bat
    fzf
    oha
    ripgrep
    yazi
  ];
in
infraTools
++ gitTools
++ nixTools
++ toys
