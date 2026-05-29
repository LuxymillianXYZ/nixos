{ config, lib, pkgs, ... }:
{
  networking.hostName = "gremory"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Zagreb";


  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  services.displayManager.ly.enable = true;

  users.users.luxymillian = {
    isNormalUser = true;
    extraGroups = [ "wheel" "vboxusers" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  fonts.packages = with pkgs; [
    maple-mono.NF
  ];

}
