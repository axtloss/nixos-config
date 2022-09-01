{ config, pkgs, ... }:

{
    nix = {
        package = pkgs.nixUnstable;
        extraOptions = ''
        experimental-features = nix-command flakes
        '';
    };

    programs.fish.enable = true;
    programs.kdeconnect = {
        package = pkgs.gnomeExtensions.gsconnect;
	enable = true;
    };
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        gnome.sushi
        lsd
        timeshift
        git
        vim
        vscode
	openssl
	uutils-coreutils
	virt-manager
    ];

    services.fwupd.enable = true;
    services.flatpak.enable = true;
    xdg.portal.enable = true;
}
