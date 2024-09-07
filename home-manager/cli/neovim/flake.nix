{
  description = "peloeil's configuration of Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # package manager
    lazy_nvim = {
      url = "github:folke/lazy.nvim";
      flake = false;
    };

    # completion
    nvim_cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
    nvim_snippy = {
      url = "github:dcampos/nvim-snippy";
      flake = false;
    };
    cmp_snippy = {
      url = "github:dcampos/cmp-snippy";
      flake = false;
    };
    cmp_buffer = {
      url = "github:hrsh7th/cmp-buffer";
      flake = false;
    };
    cmp_path = {
      url = "github:hrsh7th/cmp-path";
      flake = false;
    };
    cmp_cmdline = {
      url = "github:hrsh7th/cmp-cmdline";
      flake = false;
    };
    cmp_nvim_lsp = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };

    # LSP
    nvim_lspconfig = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };

    # formatter
    conform_nvim = {
      url = "github:stevearc/conform.nvim";
      flake = false;
    };

    # filer
    oil_nvim = {
      url = "github:stevearc/oil.nvim";
      flake = false;
    };

    # UI
    gruvbox_nvim = {
      url = "github:ellisonleao/gruvbox.nvim";
      flake = false;
    };
    lualine_nvim = {
      url = "github:nvim-lualine/lualine.nvim";
      flake = false;
    };

    # misc
    hop_nvim = {
      url = "github:smoka7/hop.nvim";
      flake = false;
    };
    hlchunk_nvim = {
      url = "github:shellRaining/hlchunk.nvim";
      flake = false;
    };
    nvim_web_devicons = {
      url = "github:nvim-tree/nvim-web-devicons";
      flake = false;
    };
    nvim_colorizer = {
      url = "github:norcalli/nvim-colorizer.lua";
      flake = false;
    };
    nvim_autopairs = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };
    nvim_surround = {
      url = "github:kylechui/nvim-surround";
      flake = false;
    };
    gitsigns_nvim = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };
    which_key_nvim = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };
    toggleterm_nvim = {
      url = "github:akinsho/toggleterm.nvim";
      flake = false;
    };
    trouble_nvim = {
      url = "github:folke/trouble.nvim";
      flake = false;
    };
    aerial_nvim = {
      url = "github:stevearc/aerial.nvim";
      flake = false;
    };
    alpha_nvim = {
      url = "github:goolord/alpha-nvim";
      flake = false;
    };
    obsidian_bridge_nvim = {
      url = "github:oflisback/obsidian-bridge.nvim";
      flake = false;
    };
    plenary_nvim = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };
    telescope_nvim = {
      url = "github:nvim-telescope/telescope.nvim";
      flake = false;
    };
    telescope_frecency_nvim = {
      url = "github:nvim-telescope/telescope-frecency.nvim";
      flake = false;
    };
    telescope_file_browser_nvim = {
      url = "github:nvim-telescope/telescope-file-browser.nvim";
      flake = false;
    };
    telescope_fzf_native_nvim = {
      url = "github:nvim-telescope/telescope-fzf-native.nvim";
      flake = false;
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      allSystems = [
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-linux" # 64-bit x86_64 Linux
        "aarch64-darwin" # 64-bit ARM macOS
        "x86_64-darwin" # 64-bit x86_64 macOS
      ];
      forAllSystems = nixpkgs.lib.genAttrs allSystems;
    in
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          plugins = import ./config/plugins.nix { inherit inputs pkgs; };
          lsp = import ./config/lsp.nix { inherit pkgs; };
          fmter = import ./config/formatter.nix { inherit pkgs; };
          tools = import ./config/tools.nix { inherit pkgs; };
          config = pkgs.callPackage ./config { inherit pkgs plugins; };
          nvim-with =
            tools:
            pkgs.writeShellScriptBin "nvim" ''
              PATH=$PATH:${pkgs.lib.makeBinPath tools}
              MY_CONFIG_PATH=${config} ${pkgs.neovim-unwrapped}/bin/nvim -u ${config}/init.lua "$@"
            '';
        in
        {
          default = nvim-with (lsp ++ fmter ++ tools);
          inherit config;
        }
      );
    };
}
