{ ... }:

{
  imports = [
    ../../modules/yubikey
  ];

  users.users.fabian.hashedPassword = "$y$j9T$LWe4pH/0thxFzM6AaiZEQ0$o8NSwRSOYeSkvM5AQI0LUv/X19P4hTkiReSr24dUbC/";

  systemd.tmpfiles.rules = [
    "L /root/.ssh - - - - /home/fabian/.ssh"
  ];
}