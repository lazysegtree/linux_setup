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
