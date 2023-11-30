{
  outputs = _: {
    nixosModules.desktop = import ./hosts/desktop/default.nix;
  };
}