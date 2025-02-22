-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "<leader>t", ":tabedit<Return>", opts)
keymap.set("n", "<Tab>", ":tabnext<Return>", opts)
keymap.set("n", "<S-Tab>", ":tabprev<Return>", opts)

--Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sk", "<C-w>k")

-- Resize window
keymap.set("n", "<C><left>", "<C-w><")
keymap.set("n", "<C><right>", "<C-w>>")
keymap.set("n", "<C><up>", "<C-w>+")
keymap.set("n", "<C><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-e>", function()
  vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "<C-E>", function()
  vim.diagnostic.goto_prev()
end, opts)
