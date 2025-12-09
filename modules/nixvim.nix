{ programs, ... }:
{
  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      shiftwidth = 2;
    }
  }
}