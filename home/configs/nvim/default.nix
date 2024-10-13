{
  pkgs,
  config,
  ...
}:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  nvim_dir = "${config.home.homeDirectory}/.dots/home/configs/nvim";
in
{
  xdg.configFile = {
    "nvim/after".source = mkOutOfStoreSymlink nvim_dir + "/after";
    "nvim/init.lua".source = mkOutOfStoreSymlink nvim_dir + "/init.lua";
    "nvim/plugin".source = mkOutOfStoreSymlink nvim_dir + "/plugin";
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
      nodePackages.typescript-language-server
      pyright
      basedpyright
      python3Packages.jedi-language-server
      ruff
      rust-analyzer
      typos-lsp
      zls

      # Formatter & Linters.
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
      cloak-nvim
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      conform-nvim
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
      nvim-ufo
      nvim-web-devicons
      oil-nvim
      render-markdown
      telescope-nvim
      tokyonight-nvim
      treesj
      undotree
      vim-better-whitespace
      vim-fugitive
      vim-illuminate
      virt-column-nvim
      zen-mode-nvim
    ];
  };
}
