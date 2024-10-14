{pkgs, ...}: {
  home = {
    packages = with pkgs; [eza];
    shellAliases = rec {
      eza = "${pkgs.eza}/bin/eza --git --icons --group-directories-first";
      ls = "${eza}";
      l = "${eza}";
      la = "${eza} --all";
      ll = "${eza} --long";
      lla = "${eza} --long --all";
      t = "${eza} --tree";
      ta = "${eza} --tree --all";
      tl = "${eza} --tree --long";
      tla = "${eza} --tree --long --all";
    };
  };
}
