{ config, pkgs, ... }:

{
  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "wilace";
      userEmail = "170810759+wilace@users.noreply.github.com";
    };

    zsh.enable = true;
  };

  # Enable zsh.pure
  programs.zsh.plugins = [{
    name = "pure";
    src = pkgs.fetchFromGitHub {
      owner = "sindresorhus";
      repo = "pure";
      rev = "v1.23.0";
      sha256 = "1jcb5cg1539iy89vm9d59g8lnp3dm0yv88mmlhkp9zwx3bihwr06";
    };
  }];
}
