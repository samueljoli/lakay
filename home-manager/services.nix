{ pkgs }:
let
  pinentry-mac = pkgs.pinentry_mac;
in
{
  gpg-agent = {
    enable = false;
    # pinentryPackage = "${pinentry-mac}/bin/pinentry-mac";
    # pinentryPackage = "${pinentry-mac}/bin/pinentry-mac"; NOTE: https://github.com/NixOS/nixpkgs/issues/240819
  };
}
