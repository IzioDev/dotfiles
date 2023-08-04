local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "c",
    "markdown",
    "markdown_inline",
    "rust",
    "terraform",
    "yaml",
    "prisma",
  },
  indent = {
    enable = false,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "html-lsp",
    "angular-language-server",
    "eslint-lsp",

    -- real man stuff
    "terraform-ls",
    "rust-analyzer",

    "pyright",
    "autopep8",
    "yaml-language-server",
    "prisma-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.copilot = {
  suggestion = {
    auto_trigger = true,
  },
}

return M
