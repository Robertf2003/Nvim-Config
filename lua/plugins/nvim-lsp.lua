return { 
  {
    "neovim/nvim-lspconfig",
    build = "npm i -g pyright",
    keys = {
      {
        "<leader>hh",
        "<cmd>LspClangdSwitchSourceHeader<cr>",
        desc = "Switch between header and source file",
      },
    }
  },
}
