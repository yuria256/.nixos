{ programs, ... }:
{
  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    config = {
      disableMinSize = true;
      plugins = {
        # We love Piracy
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        onePingPerDM.enable = true;
      };
    };
  };
}