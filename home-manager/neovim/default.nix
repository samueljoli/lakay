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
    ${builtins.readFile ./tokyo_night.lua}
    ${builtins.readFile ./treesitter.lua}
    ${builtins.readFile ./hop.lua}
    ${builtins.readFile ./telescope.lua}
    ${builtins.readFile ./yazi.lua}
    ${builtins.readFile ./comment.lua}
    ${builtins.readFile ./gitsigns.lua}
    ${builtins.readFile ./colorizer.lua}
    ${builtins.readFile ./autopairs.lua}
    ${builtins.readFile ./heirline.lua}
    ${builtins.readFile ./lazydev.lua}
    ${builtins.readFile ./lsp.lua}
    ${builtins.readFile ./conform.lua}
    ${builtins.readFile ./cmp.lua}
    ${builtins.readFile ./grug.lua}
    ${builtins.readFile ./tint.lua}
    ${builtins.readFile ./statuscolumn.lua}
  '';

  plugins = with pkgs.vimPlugins; [
    tokyonight-nvim

    vim-nix

    pkgs.vimPlugins.foreign-cyberpunk-nvim

    nvim-treesitter.withAllGrammars
    nvim-treesitter-textobjects

    hop-nvim

    nvim-web-devicons
    plenary-nvim
    telescope-fzf-native-nvim
    telescope-ui-select-nvim
    telescope-nvim

    pkgs.vimPlugins.foreign-dir-telescope

    pkgs.vimPlugins.foreign-yazi-nvim

    pkgs.vimPlugins.foreign-grug-nvim

    pkgs.vimPlugins.foreign-tint-nvim

    foreign-statuscolumn-nvim

    foreign-vim-kitty

    comment-nvim
    gitsigns-nvim
    nvim-colorizer-lua
    nvim-autopairs

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
    typescript-tools-nvim
    rustaceanvim

    conform-nvim

    nvim-cmp
    cmp-path

    cmp_luasnip
    cmp-nvim-lsp
    
    luasnip
    friendly-snippets
  ];

  extraLuaPackages = ps: [ ps.jsregexp ];
}
