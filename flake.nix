{
  outputs = _: {
    nixosModules.desktop = import ./hosts/desktop/default.nix;
    nixosModules.laptop = import ./hosts/laptop/default.nix;
  };
}
