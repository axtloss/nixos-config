{ config, pkgs, ... }:

{
    users.users.axtlos = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        shell = pkgs.fish;
        packages = with pkgs; [
        #     thunderbird
        ];
    };
}