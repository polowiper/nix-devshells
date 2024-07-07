{
  description = "A basic scientific python devshell";

  inputs.nixpkgs.url = "nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        python311
        python311Packages.apscheduler
        python311Packages.matplotlib
        python311Packages.discordpy
        python311Packages.requests
        python311Packages.pytz
      ];
      shellHook = ''
        echo "Python devShell"
      '';
    };
  };
}
