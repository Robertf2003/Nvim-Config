return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behavior
        ["core.concealer"] = {}, -- Adds pretty icons/concealing
        ["core.dirman"] = { -- Manages workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    })
  end,
}
