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

  boot.kernel.sysctl  = {
    "net.ipv4.ip_unprivileged_port_start" = 23;
  };

  security.pam.services.sddm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

}
