return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")

      fzf.setup()

      local function find_files()
        fzf.files({
          previewer = false,
          fzf_opts = { ["--layout"] = "reverse-list" },
          winopts = { row = 1, width = 0.5, height = 0.5 },
        })
      end

      local function grep()
        fzf.live_grep()
      end

      vim.keymap.set("n", "<leader>f", find_files)
      vim.keymap.set("n", "<leader>g", grep)
      vim.keymap.set("n", "<leader>e", fzf.lsp_document_diagnostics)
    end,
  },
}
