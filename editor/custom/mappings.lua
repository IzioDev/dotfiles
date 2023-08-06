---@type MappingsTable
local M = {}

local function generate_harpoon_quickjump_table(length)
  local table = {}
  for i = 1, length do
    table["<F" .. i .. ">"] = {
      function()
        require("harpoon.ui").nav_file(i)
      end,
      "jump to " .. i,
    }
  end
  return table
end

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>fw"] = {
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      "live grep args",
    },
    ["<leader>fb"] = { ":Telescope file_browser<CR>", "file browser", opts = { nowait = true } },
    ["<leader>e"] = {
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      "file browser in-place",
      opts = { nowait = true },
    },
    ["<leader>ha"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "add file to harpoon",
    },
    ["<leader>hh"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "toggle harpoon menu",
    },
  },
}

table.foreach(generate_harpoon_quickjump_table(5), function(k, v)
  M.general.n[k] = v
end)
-- more keybinds!

return M
