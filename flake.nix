{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; };

        opentofu-with-docker = pkgs.opentofu.withPlugins (p: [
          p.kreuzwerker_docker
        ]);

      in
      pkgs.mkShell {
        name = "opentofu-docker";

        packages = [
          pkgs.tofu-ls
          opentofu-with-docker
        ];

        shellHook = ''
          echo "=========================================="
          echo "  OpenTofu + Docker devshell"
          echo "=========================================="
          echo ""
          echo ""
          echo "=========================================="
        '';
      };
  };
}
