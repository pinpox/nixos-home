{ config, pkgs, lib, ... }: {
  programs.chromium = {
    enable = true;
    extraOpts = {
      # "BrowserSignin" = 0;
      # "SyncDisabled" = true;
      "PasswordManagerEnabled" = false;
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [ "de" "en-US" ];
    };

    extensions = [

      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # Ublock Origin

    ];
  };
}
