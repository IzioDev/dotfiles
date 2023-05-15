local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "rust_analyzer",
  "tsserver",
  "terraform_lsp",
  "docker_compose_language_service",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local util = require "lspconfig.util"

lspconfig["angularls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("angular.json", "project.json"),
}

lspconfig["eslint"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
