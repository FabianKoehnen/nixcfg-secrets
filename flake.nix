{
  outputs = _: {
    nixosModules.desktop = import ./desktop/default.nix;
  };
}