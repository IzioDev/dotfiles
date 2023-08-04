---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>fw"] = {
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      "live grep args",
    },
  },
}

-- more keybinds!

return M
