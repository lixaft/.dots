{
  flakeLib,
  pkgs,
  ...
}: {
  xdg.configFile = {
    "nvim/after".source = ./after;
    "nvim/colors".source = ./colors;
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua/flake".source = ./lua/flake;
    "nvim/package.json".source = ./package.json;
    "nvim/plugin".source = ./plugin;
    "nvim/snippets".source = ./snippets;
    "nvim/lua/_flakeColors.lua".text =
      # lua
      ''
        return vim.json.decode([[${builtins.toJSON flakeLib.colors}]])
      '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    extraPackages = with pkgs; [
      # Dependencies.
      chafa # Required by fzf-lua.
      delta # Required by fzf-lua.
      fd # Required by fzf-lua.
      fswatch # Required by nvim.
      fzf # Required by fzf-lua.
      postgresql # Required by dadbod.
      python3Packages.pylatexenc # Required by render-markdown.
      ripgrep # Required by fzf-lua.
      sqlite # Required by dadbod.
      tree-sitter # Required by nvim.
      ueberzugpp # Required by fzf-lua.
      viu # Required by fzf-lua.
      zig # Required for zls.

      # LSP.
      bash-language-server
      clang-tools
      cmake-language-server
      gopls
      lua-language-server
      nil
      ols
      postgres-lsp
      pyright
      ruff
      rust-analyzer
      typos-lsp
      zls

      # Formatter & Linters.
      alejandra
      mypy
      nodePackages.prettier
      selene
      shfmt
      stylua
    ];

    plugins = with pkgs.vimPlugins; [
      blink-cmp
      conform-nvim
      fzf-lua
      gitsigns-nvim
      harpoon2
      indent-o-matic
      lazydev-nvim
      nvim-colorizer-lua
      nvim-lint
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      oil-nvim
      render-markdown-nvim
      snacks-nvim
      treesj
      undotree
      vim-better-whitespace
      vim-dadbod
      vim-dadbod-completion
      vim-dadbod-ui
      vim-fugitive
      vim-illuminate
      virt-column-nvim
    ];
  };
}
