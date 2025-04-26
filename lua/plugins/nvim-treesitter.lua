return { 
  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" },
      sync_install = true,
      auto_install = true,
    },
  }
}
