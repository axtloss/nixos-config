{ lib, config, pkgs, ...}:

{
    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";
#    boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest.nvidia_x11_beta_open;

    hardware.nvidia.modesetting.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];

   services.switcherooControl.enable = true;

   services.udev.extraRules = "SUBSYSTEM==\"usb\", ATTR{idVendor}==\"18d1\", GROUP=\"wheel\"\n";

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "22.05"; # Did you read the comment?
}
