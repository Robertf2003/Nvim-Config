return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        "<leader>ng",
        "<cmd>Neogen<cr>",
        desc = "Telescope Live Grep",
      },
    },
  }
}
