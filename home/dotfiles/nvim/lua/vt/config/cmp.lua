local M = {}

function M.setup()
  local cmp = require("cmp")

  require("copilot_cmp").setup()

  cmp.setup({
    compltion = {
      completeopt = "menu,menuone,preview,noselect",
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    }),

    sources = cmp.config.sources({
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    }, { name = "buffer" }),
  })
end

return M
