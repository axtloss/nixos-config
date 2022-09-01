{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stable.url = "github:NixOS/nixpkgs/release-22.05";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus/v1.3.1";
    nur.url = "github:nix-community/NUR";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-21.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixos-hardware, home-manager, nur, utils, stable, ... }:
    utils.lib.mkFlake {
      inherit self inputs;
      
      # Channel config
      channels.nixpkgs.input = nixpkgs;
      channelsConfig.allowUnfree = true;
      sharedOverlays = [
        nur.overlay
      ];

      hosts.nixowos5 = {
        system = "x86_64-linux";
        channelName = "nixpkgs";
        modules = [
          ./boot.nix
          ./gnome.nix
          ./hardware-configuration.nix
          ./networking.nix
          ./nvidia.nix
          ./packages.nix
          ./sound.nix
          ./users.nix
          ./virtualisation.nix
        ];
      };
    };
}
