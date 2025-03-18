{
  imports = [
    ../home.nix
  ];

  home = rec {
    username = "wilace";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };
}