{ config, lib, pkgs, ... }:

{
  imports =
    [
      ../base-configuration.nix
    ];

  # Define a user account.
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  # Define hostname.
  networking.hostName = "hemera";

  # Enable wsl.
  wsl = {
    enable = true;
    defaultUser = "nixos";
  };

  environment.systemPackages = with pkgs; [
    git
    wget
  ];
}
