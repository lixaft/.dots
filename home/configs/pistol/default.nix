{pkgs, ...}: {
  programs.pistol = {
    enable = true;
    associations = [
      {
        mime = "text/*";
        command = "bat --paging=never --decorations=never --color=always %pistol-filename%";
      }
      {
        mime = "image/*";
        command = "${pkgs.chafa}/bin/chafa %pistol-filename%";
      }
    ];
  };
}
