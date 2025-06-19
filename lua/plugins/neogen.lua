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
      c = {
        template = {
          annotation_convention = "doxygen"
        }
      },
      cpp = {
        template = {
          annotation_convention = "doxygen"
        }
      },
      javascript = {
        template = {
          annotation_convention = "JSDoc"
        }
      },
      typescript = {
        template = {
          annotation_convention = "TSDoc"
        }
      },
    }
  },
  keys = {
    {
      "<leader>ng",
      "<cmd>Neogen<cr>",
      desc = "Neogen",
    },
  },
}
