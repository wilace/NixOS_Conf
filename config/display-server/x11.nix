{ lib, ... }:

{
  services.xserver = {
    enable = true;

    xkb = {
      layout = "jp";
      model = "pc106";
    };
  };
  console.useXkbConfig = lib.mkForce true;
}