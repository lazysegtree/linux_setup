require("config.lazy")

vim.lsp.config('harper_ls', {
  settings = {
    ["harper-ls"] = {
      userDictPath = "~/dict.txt"
    }
  },
})
vim.lsp.enable('harper_ls')
-- system clipboard
vim.opt.clipboard = "unnamedplus"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true



vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.whichwrap:append(">")
vim.opt.whichwrap:append("<")

-- Interpret the existing iTerm2 shortcuts like zsh does while in Insert mode.
local function imap(lhs, rhs, description)
  vim.keymap.set("i", lhs, rhs, {
    silent = true,
    desc = description,
  })
end

imap("<M-b>", "<C-G>U<C-Left>", "Move one word left")
imap("<M-f>", "<C-G>U<C-Right>", "Move one word right")
imap("<M-BS>", "<C-W>", "Delete previous word")
imap("<C-A>", "<C-G>U<Home>", "Move to beginning of line")
imap("<C-E>", "<C-G>U<End>", "Move to end of line")
