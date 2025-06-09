{
  flakeLib,
  pkgs,
  ...
}: {
  xdg.configFile = {
    "nvim/after".source = ./after;
    "nvim/colors".source = ./colors;
    "nvim/init.lua".source = ./init.lua;
    "nvim/plugin".source = ./plugin;
    "nvim/snippets".source = ./snippets;
    "nvim/lua/flake".source = ./lua/flake;
    "nvim/lua/conform".source = ./lua/conform;
    "nvim/lua/_flake_colors.lua".text =
      # lua
      ''
        return vim.json.decode([[${builtins.toJSON flakeLib.colors}]])
      '';
  };

  programs.neovim = {
    enable = true;

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
      zig # Required by zls.

      # LSP.
      bash-language-server
      clang-tools
      cmake-language-server
      gopls
      lua-language-server
      nil
      postgres-lsp
      pyright
      ruff
      rust-analyzer
      ty
      typos-lsp
      zls

      # Formatter & Linters.
      alejandra
      meson
      mypy
      nodePackages.prettier
      shfmt
      stylua
    ];

    plugins = with pkgs.vimPlugins; [
      blink-cmp
      conform-nvim
      fzf-lua
      gitsigns-nvim
      indent-o-matic
      lazydev-nvim
      marks-nvim
      nvim-colorizer-lua
      nvim-lint
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      oil-nvim
      quicker-nvim
      render-markdown-nvim
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
