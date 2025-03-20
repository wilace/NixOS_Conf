{ lib, pkgs, ... }:
let
  config-dir = ../config;
in
{
  imports =
    [
      (config-dir + "/base-configuration.nix")
      (config-dir + "/i18n.nix")
      (config-dir + "/font.nix")
      (config-dir + "/sound.nix")
    ];

  # Define a user account.
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  # Define hostname.
  networking.hostName = "wsl";
}
