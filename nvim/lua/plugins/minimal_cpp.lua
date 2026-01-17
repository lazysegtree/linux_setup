return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Native Neovim LSP config (0.11+)
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index" },
      })

      -- Enable the server
      vim.lsp.enable("clangd")
      vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.keymap.set(
      "n",
      "gd",
      vim.lsp.buf.definition,
      { buffer = ev.buf, silent = true }
    )
  end,
})
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "cpp" },
        highlight = { enable = true },
      })
    end,
  },
}

