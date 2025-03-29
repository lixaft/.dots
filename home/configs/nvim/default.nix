{pkgs, ...}: {
  xdg.configFile = {
    "nvim/after".source = ./after;
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua".source = ./lua;
    "nvim/plugin".source = ./plugin;
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
      friendly-snippets
      fzf-lua
      gitsigns-nvim
      indent-o-matic
      lazydev-nvim
      lualine-nvim
      nvim-colorizer-lua
      nvim-lint
      # nvim-lspconfig
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      oil-nvim
      render-markdown-nvim
      tokyonight-nvim
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
