let
  config-dir = ../config;
in
{
  imports = [
    (config-dir + "/base-home.nix")
  ];

  home = {
    username = "wilace";
    homeDirectory = "/home/wilace";
    stateVersion = "24.11";
  };
}