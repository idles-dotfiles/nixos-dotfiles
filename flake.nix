{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    herdr = {
      url = "github:ogulcancelik/herdr";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fast = {
      url = "github:maaslalani/fast";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silicate = {
      url = "github:pure-sagacity/silicate";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    clonee = {
      url = "git+https://gitea.maariz.org/pure_sagacity/clonee";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium = {
      url = "github:AlvaroParker/helium-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sonora = {
      url = "github:idle-river/sonora";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/pc/configuration.nix

          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              backupFileExtension = "backup";

              users = {
                river = import ./home/river;
                aariz = import ./home/aariz;
              };
            };
          }
        ];
      };
    };
}
