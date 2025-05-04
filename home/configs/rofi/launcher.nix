{flakeLib, ...}: let
  c = flakeLib.colors;
in
  # rasi
  ''
    configuration {
        show-icons: true;
        display-drun: ":";
    }

    * {
        color: ${c.fg};
        background-color: ${c.bg2};
    }

    window {
        anchor: north;
        location: north;
        width: 100%;
        children: [mainbox];
    }

    mainbox {
        orientation: horizontal;
        children: [prompt, entry, listview];
    }

    prompt {
        color: ${c.lavender};
        padding: 0 12px 0 12px;
    }

    entry {
        placeholder: "run";
        placeholder-color: ${c.syntax.comment};
        width: 32em;
        expand: false;
    }

    listview {
        layout: horizontal;
        lines: 100;
    }

    element {
        orientation: horizontal;
        padding: 2px 8px;
    }

    element-text {
        background-color: inherit;
    }

    element-icon {
        background-color: inherit;
    }

    element selected {
        background-color: ${c.ui.selection};
    }

    element-text selected {
        color: ${c.white};
        font-weight: bold;
    }
  ''
