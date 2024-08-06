{...}: {
  imports = [
    ../../../modules/yubikey
  ];

  users.users.fabian.hashedPassword = "$y$j9T$ZRSrGyql6kwEpH4RXtD8h.$pJAQKVbbvmuPd25VqUCK867M0cUG.dWoS2fDtUH/S33";

  systemd.tmpfiles.rules = [
    "L /root/.ssh - - - - /home/fabian/.ssh"
  ];

  networking.hosts = {
    "127.0.0.1" = [
      "elfbar.docker"
      "petfriends.docker"
      "edh.docker"
    ];
  };


  security.pam.services.sddm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

}
