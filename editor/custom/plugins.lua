local overrides = require "custom.configs.overrides"
local nvimcmp_overrides = require "custom.configs.nvim-cmp"
local telescope_overrides = require "custom.configs.telescope.telescope"
---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Useful Lua utilities

      -- FZF sorter for Telescope
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    opts = telescope_overrides.telescope,
  },
  { "folke/neodev.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
      },
    },
    config = function()
      require "custom.configs.null-ls"
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "pmizio/typescript-tools.nvim",
    dev = true,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "IzioDev/typescript-tools-nx.nvim",
    dev = true,
    dependencies = { "pmizio/typescript-tools.nvim" },
    opts = {},
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  -- {
  -- 	"nvim-tree/nvim-tree.lua",
  -- 	opts = overrides.nvimtree,
  -- },

  -- Install a plugin
  -- {
  --   "max397574/better-escape.nvim",
  --   event = "InsertEnter",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- },
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = nvimcmp_overrides,
  },
  {
    "NvChad/nvterm",
    enabled = false,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
