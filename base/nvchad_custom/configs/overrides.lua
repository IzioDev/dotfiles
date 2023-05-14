local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",
    "rust",
    "html",
    "css",
    "javascript",
    "typescript",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return M
