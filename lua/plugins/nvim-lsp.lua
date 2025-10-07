return { 
  {
    "neovim/nvim-lspconfig",
    build = "npm i -g pyright && \
    pip install cmake-language-server && \
    npm i -g vscode-langservers-extracted && \
    npm install -g vim-language-server",
    keys = {
      {
        "<leader>hh",
        "<cmd>LspClangdSwitchSourceHeader<cr>",
        desc = "Switch between header and source file",
      },
    },
  }
}
