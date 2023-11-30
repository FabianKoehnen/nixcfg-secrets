{ config, pkgs, inputs, user, ... }:

let 
  u2f_key_config = {
    black = "7xsvEmguShVsW23FNtEHjDbaz8PSnb9jBBlcHu+Ckn5u2O53tZy5aVjs86c1R3ZEdSmLx5pVqk0IWXsy+LPr6g==,/zBovPhUAkDDi3FbH1Sp54PEL+OOWO5zMfolia7xhOIrzcNEbU9w3pk1RdR7SZkpfipHnI2yVUYXCHXVhjssHw==,es256,+presence";
    red = "81bmKCyf0IFrQM7v2e5e7WeMFM/Yrk8gbP+Wrdin9mLNFtXITTi49RHiU9lzie6TPkRQkaXA4lZmRPrYTYZlaw==,SwhnnptyBXWOKsHP9XjJFM5oQjtMKxhqSQJFNkDTvSgFT4LnGP2tzjQZjeKgyFRImxU7kn7xm0IDIkkulMrMqw==,es256,+presence";
  };
in 
{
  security.pam = {
    u2f = {
      cue = true;
      authFile = pkgs.writeText "u2f_keys" 
        ''
        fabian:${u2f_key_config.black}:${u2f_key_config.red}
        '';
    };

    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
      sddm = {
        u2fAuth = true;
        text = ''
          auth sufficient ${pkgs.pam_u2f}/lib/security/pam_u2f.so authfile=${config.security.pam.u2f.authFile}
        '';
      };
      sddm-greeter= {
        u2fAuth = true;
        text = ''
          auth sufficient ${pkgs.pam_u2f}/lib/security/pam_u2f.so authfile=${config.security.pam.u2f.authFile}
        '';
      };
    };
  };

  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    pam_u2f

    yubikey-manager
    yubikey-manager-qt
    yubikey-personalization
    yubikey-personalization-gui
    yubico-piv-tool
    yubioath-flutter
  ];
}