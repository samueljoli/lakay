{ inputs, pkgs }:

let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{
  enable = true;
  package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  extraLuaConfig = ''
    ${builtins.readFile ./options.lua}
    ${builtins.readFile ./keymaps.lua}
    ${builtins.readFile ./cyberpunk.lua}
    ${builtins.readFile ./treesitter.lua}
    ${builtins.readFile ./hop.lua}
    ${builtins.readFile ./telescope.lua}
    ${builtins.readFile ./yazi.lua}
    ${builtins.readFile ./comment.lua}
    ${builtins.readFile ./gitsigns.lua}
    ${builtins.readFile ./colorizer.lua}
    ${builtins.readFile ./heirline.lua}
    ${builtins.readFile ./lazydev.lua}
    ${builtins.readFile ./lsp.lua}
    ${builtins.readFile ./conform.lua}
    ${builtins.readFile ./cmp.lua}
  '';

  plugins = with pkgs.vimPlugins; [
    vim-nix

    pkgs.vimPlugins.foreign-cyberpunk-nvim

    nvim-treesitter.withAllGrammars
    nvim-treesitter-textobjects

    hop-nvim

    nvim-web-devicons
    plenary-nvim
    telescope-fzf-native-nvim
    telescope-nvim
    telescope-ui-select-nvim

    pkgs.vimPlugins.foreign-yazi-nvim

    comment-nvim
    gitsigns-nvim
    nvim-colorizer-lua

    pkgs.vimPlugins.foreign-heirline-components
    heirline-nvim

    mason-nvim
    mason-lspconfig-nvim
    mason-tool-installer-nvim
    cmp-nvim-lsp
    fidget-nvim
    pkgs.vimPlugins.foreign-lazydev-nvim
    pkgs.vimPlugins.foreign-luvit-meta
    nvim-lspconfig

    conform-nvim

    cmp-path
    cmp-nvim-lsp
    cmp_luasnip
    luasnip
    nvim-cmp

    rustaceanvim
  ];

  extraLuaPackages = ps: [ ps.jsregexp ];
}
