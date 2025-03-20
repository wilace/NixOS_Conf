{ lib, pkgs, ... }:

{
  i18n = lib.mkForce {
    defaultLocale = "ja_JP.UTF-8";

    inputMethod = {
      enable = true;

      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-gtk
        fcitx5-mozc
      ];
    };
  };
}