let
  server = fetchTarball {
    url = "https://github.com/msteen/nixos-vscode-server/tarball/master";
    sha256 = "0e5bc9bf7de69795132a0bb86f41dab8e7c52280f1e905ed6ea505def59e4426";
  };
in
{
  imports = [
    ../home.nix
    "${server}/modules/vscode-server/home.nix"
  ];

  services.vscode-server.enable = true;

  home = rec {
    username = "nixos";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };
}
