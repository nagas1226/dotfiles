-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set
map("i", "jj", "<ESC>")

-- Toggle background transparency
map("n", "<leader>ut", function()
  local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  if normal.bg then
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  else
    vim.api.nvim_set_hl(0, "Normal", { bg = "#1a1b26" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1b26" })
  end
end, { desc = "Toggle Transparency" })
