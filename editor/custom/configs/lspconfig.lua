local on_init = require("plugins.configs.lspconfig").on_init
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  -- "html",
  -- "cssls",
  -- "rust_analyzer",
  -- "terraformls",
  -- "docker_compose_language_service",
  -- "pyright",
  -- "prismals",
  "lua_ls",
}

require("neodev").setup {}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local util = require "lspconfig.util"

-- lspconfig["angularls"].setup({
-- 	on_init = on_init,
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	-- root_dir = util.root_pattern("angular.json", "project.json"),
-- 	root_dir = util.root_pattern(".git"),
-- })

-- lspconfig["tsserver"].setup {
--   on_init = on_init,
--   on_attach = on_attach,
--   capabilities = capabilities,
--   -- root_dir = util.root_pattern("angular.json", "project.json"),
--   root_dir = util.root_pattern ".git",
-- }

lspconfig["lua_ls"].setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

lspconfig["yamlls"].setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = { kubernetes = "globPattern" },
    },
  },
}

require("typescript-tools").setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern ".git",
  settings = {
    tsserver_plugins = {
      "@monodon/typescript-nx-imports-plugin",
    },
    tsserver_logs = "verbose",
  },
}

require("typescript-tools-nx").setup()
