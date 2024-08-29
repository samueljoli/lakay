{ pkgs }:

let
  inherit (pkgs.lib) fakeHash;

  nu = name: script: pkgs.nuenv.mkScript { inherit name script; };
in
[
  (nu "docker-clean" ''
    docker system prune -af
    docker volume prune -f
    docker image prune -af
  '')
]
