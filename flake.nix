{
  description = "a tModloader 1.4 mod project.";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs;
          let
            tModDeps = [ mono dotnet-sdk ];
            devDeps = [ nil nixfmt-classic omnisharp-roslyn ];
          in tModDeps ++ devDeps;
      };
    };
}
