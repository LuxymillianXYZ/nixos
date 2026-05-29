{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.gremory = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # change this if you're on aarch64 or other
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          home-manager.users.luxymillian = { pkgs, ... }: {
            home.stateVersion = "25.11";
            programs.git.enable = true;
            home.file.".config/kitty/kitty.conf".source = ./configs/kitty.conf;
            home.file.".config/fuzzel/fuzzel.ini".source = ./configs/fuzzel.ini;
            home.file.".config/fastfetch/config.jsonc".source = ./configs/config.jsonc;
            home.file.".config/sway/config".source = ./configs/sway;
            home.file.".config/sway/status.sh".source = ./configs/status.sh;
            home.file.".config/mako/config".source = ./configs/mako;
            home.file."powermenu.sh".source = ./configs/powermenu.sh;
            home.file.".vimrc".source = ./configs/.vimrc;
            home.file.".bashrc".source = ./configs/.bashrc;
            home.file.".config/waybar/config".source = ./configs/waybar;
            home.file.".config/waybar/style.css".source = ./configs/style.css;
            home.file."status.sh".source = ./configs/status.sh;
            home.file."clock.sh".source = ./configs/clock.sh;
            home.file."nirist.sh".source = ./configs/nirist.sh;
            home.file.".config/niri/config.kdl".source = ./configs/config.kdl;
            home.file.".config/vimconf" = {
                    source = ./configs/vimconf;
                    recursive = false;
                };
          };
        }
      ];
    };
  };
}

