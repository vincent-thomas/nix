return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local actions = require("vt.config.telescope")

      vim.keymap.set("n", "<leader>g", actions.content_search, { desc = "Fuzzy find files in cwd" })
    end,
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
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

      vim.keymap.set("n", "<leader>f", find_files)
    end,
  },
}
