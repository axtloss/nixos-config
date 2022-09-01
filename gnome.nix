{ pkgs, config, ... }:

{
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        useXkbConfig = true; # use xkbOptions in tty.
    };

    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
        layout = "us";
    };
}
