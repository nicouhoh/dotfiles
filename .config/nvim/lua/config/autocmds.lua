-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste"
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- keymap to launch current html file in browser
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "typescript" },
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ":!firefox %<CR>", { noremap = true, silent = true })
  end,
})

-- wrap at 72 chars for git commits
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  callback = function()
    vim.opt.textwidth = 72
  end,
})
