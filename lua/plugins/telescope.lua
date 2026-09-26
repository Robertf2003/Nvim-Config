return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons'},
    keys = {
      {
        "<leader>fb",
        "<cmd>Telescope builtin<cr>",
        desc = "See Telescope builtins",
      },
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Use Telescope to find files by name",
      },
      {
        "<leader>fF",
        "<cmd>Telescope git_files<cr>",
        desc = "Use Telescope to find files tracked by git",
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Use Telescope to grep for something in files",
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "See Telescope help tages",
      },
      {
        "<leader>fH",
        "<cmd>Telescope search_history<cr>",
        desc = "See Telescope history",
      },
      {
        "<leader>ft",
        "<cmd>Telescope treesitter<cr>",
        desc = "See Telescope treesitter for functions",
      },
      {
        "<leader>fp",
        "<cmd>Telescope projects<cr>",
        desc = "See Telescope treesitter for projects",
      },

    },
  }
}
