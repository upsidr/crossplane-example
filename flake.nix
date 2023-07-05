{
  description = "Crossplane Example";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, poetry2nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs-unstable.legacyPackages.${system};

        basePackages = with pkgs; [
          kind
          kubectl
          kustomize
          kubernetes-helm
          kubeseal
          fluxcd
          k9s
          envsubst
          # TODO: Add Importer which is used for AWS region handling
        ];

        customOverrides = self: super: {
          # Overrides go here
        };
      in
      {

        devShell = pkgs.mkShell {
          buildInputs = basePackages;
        };
      }
    );
}
