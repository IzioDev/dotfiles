local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "typescript", "javascript", "json" } },

  -- Lua
  b.formatting.stylua,

  b.formatting.eslint_d,
  b.code_actions.eslint_d,
  b.diagnostics.eslint_d,

  b.formatting.rustfmt,

  b.formatting.autopep8,

  b.formatting.terraform_fmt,
  b.formatting.yamlfmt,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format {
          timeout_ms = 5000,
          async = false,
          filter = function(_client)
            return _client.name == "null-ls"
          end,
        }
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
