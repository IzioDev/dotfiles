local on_init = require("plugins.configs.lspconfig").on_init
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "rust_analyzer",
  "tsserver",
  "terraformls",
  "docker_compose_language_service",
  "pyright",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local util = require "lspconfig.util"

lspconfig["angularls"].setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("angular.json", "project.json"),
}

lspconfig["eslint"].setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
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
