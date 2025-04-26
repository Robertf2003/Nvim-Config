return { 
  "danymat/neogen", 
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*" 
  opts = {
    languages = {
      python = {
        template = {
          annotation_convention = "reST"
        }
      },
    }
  },
  keys = {
    {
      "<leader>ng",
      "<cmd>Neogen<cr>",
      desc = "Telescope Live Grep",
    },
  },
}
