local M = {}

M.telescope = function()
  local lga_actions = require "telescope-live-grep-args.actions"
  return {
    extensions_list = { "themes", "terms", "fzf", "live_grep_args", "file_browser" },
    extensions = {
      live_grep_args = {
        auto_quoting = true, -- enable/disable auto-quoting
        -- define mappings, e.g.
        mappings = { -- extend mappings
          i = {
            ["<C-k>"] = lga_actions.quote_prompt(),
            ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
          },
        },
      },
      file_browser = {
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
      },
    },
  }
end

return M
