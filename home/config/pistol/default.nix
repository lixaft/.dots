{
  lib,
  pkgs,
  ...
}: {
  programs.pistol = {
    enable = true;
    associations = [
      {
        mime = "text/*";
        command = "${lib.getExe pkgs.bat} --paging=never --decorations=never --color=always %pistol-filename%";
      }
      {
        mime = "image/*";
        command = "${lib.getExe pkgs.chafa} %pistol-filename% --view-size %pistol-extra0%x%pistol-extra1%";
      }
    ];
  };
}
