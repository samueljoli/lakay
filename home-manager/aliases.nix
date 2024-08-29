{ pkgs }:

{
  gh = {
    pvw = "pr view --web";
    rvw = "repo view --web";
  };

  git = {
    ba = "branch -a";
    bd = "branch -D";
    br = "branch";
    cam = "commit -am";
    co = "checkout";
    cob = "checkout -b";
    ci = "commit";
    gcm = "commit -m";
    cp = "commit -p";
    crp = "cherry-pick";
    d = "diff";
    dco = "commit --amend --no-edit --signoff";
    gs = "status";
    pr = "pull --rebase";
    gst = "status";
    l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
    whoops = "reset --hard";
    wipe = "commit -s";
    fix = "rebase --exec 'git commit --amend --no-edit -S' -i origin/develop";
  };

  shell = {
    # General
    "," = "comma";
    cat = "bat";

    # Run Nix garbage collection
    xgc = "nix store gc -v";

    # Nix flake helpers
    ndc = "nix develop --command";
    nfc = "nix flake check";
    nfca = "nix flake check --all-systems";
    nfs = "nix flake show";
    nfu = "nix flake update";
    nsn = "nix search nixpkgs";

    # Restart Nix daemon
    rnd = "sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist && sudo launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist";

    # processes
    pf = "pgrep -f";
  };
}
