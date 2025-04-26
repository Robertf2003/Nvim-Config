return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Use Telescope to find files by name",
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Use Telescope to grep for something in files",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "See Telescope buffers",
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "See Telescope help tages",
      },

    },
  }
}
