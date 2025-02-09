{ config, pkgs, ... }:

{
  home = rec {
    username = "wilace";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "wilace";
      userEmail = "170810759+wilace@users.noreply.github.com";
    };
  };
}
