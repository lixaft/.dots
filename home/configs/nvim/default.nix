{pkgs, ...}: {
  xdg.configFile = {
    "nvim/after".source = ./after;
    "nvim/init.lua".source = ./init.lua;
    "nvim/plugin".source = ./plugin;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      fswatch
      tree-sitter

      # LSP.
      bash-language-server
      clang-tools
      cmake-language-server
      gopls
      lua-language-server
      nil
      nodePackages.typescript-language-server
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
      sqlfluff
      stylua
    ];

    # Aliases.
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Providers.
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    plugins = with pkgs.vimPlugins; [
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      friendly-snippets
      gitsigns-nvim
      harpoon2
      indent-o-matic
      lspkind-nvim
      lualine-nvim
      luasnip
      neodev-nvim
      none-ls-nvim
      nvim-cmp
      nvim-colorizer-lua
      nvim-lspconfig
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      oil-nvim
      render-markdown-nvim
      telescope-nvim
      tokyonight-nvim
      treesj
      undotree
      vim-better-whitespace
      vim-fugitive
      vim-illuminate
      virt-column-nvim
    ];
  };
}
