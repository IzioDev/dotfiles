local on_init = require("plugins.configs.lspconfig").on_init
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
	"html",
	"cssls",
	"rust_analyzer",
	"terraformls",
	"docker_compose_language_service",
	"pyright",
	"prismals",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

local util = require("lspconfig.util")

lspconfig["angularls"].setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	-- root_dir = util.root_pattern("angular.json", "project.json"),
	root_dir = util.root_pattern(".git"),
})

-- lspconfig["tsserver"].setup {
--   on_init = on_init,
--   on_attach = on_attach,
--   capabilities = capabilities,
--   -- root_dir = util.root_pattern("angular.json", "project.json"),
--   root_dir = util.root_pattern ".git",
-- }

lspconfig["yamlls"].setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		yaml = {
			schemas = { kubernetes = "globPattern" },
		},
	},
})

require("typescript-tools").setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = util.root_pattern(".git"),
})
