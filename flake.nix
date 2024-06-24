{
  outputs = _: {
    nixosModules.desktop = import ./hosts/desktop/default.nix;
    nixosModules.tuxSiriusGen2 = import ./hosts/work/tuxSiriusGen2/default.nix;
  };
}
