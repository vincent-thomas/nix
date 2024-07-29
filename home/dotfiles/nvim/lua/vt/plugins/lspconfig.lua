return
{
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local vt_lsp = require("vt.config.lspconfig")
    vt_lsp.setup()

    vt_lsp.on_mount(function(ev)
      local opts = { buffer = ev.buf, silent = true }

      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts)
    end)
  end,
}
