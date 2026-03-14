local o = vim.opt
-- general 
o.swapfile = false
-- indentation
o.expandtab = true   -- Turns tabs into space
o.shiftwidth = 4     -- shift 4 spaces when tab
o.tabstop = 4        -- 1 tab == 4 spaces
o.smartindent = true -- auto indent lines
-- UI
o.colorcolumn = '100'-- Line at column 100
o.showmatch = true
o.number = true
-- Setup spellcheck
o.spell = true
o.spelllang = en_us

require("config.lazy")
-- Hologram, used to allow showing images
require('hologram').setup{
  auto_display = true -- WIP automatic markdown image display, may be prone to breaking
}

explorerScript = require("explorerScript")
screenTraversalScript = require("screenTraversal")
screenTraversalScript.setup()

vim.keymap.set("n", "<F5>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F6>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F7>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F8>", ":lua require'dap'.step_into()<CR>")

vim.keymap.set("n", "<leader>ee", ":lua explorerScript.openExplorer() <CR><CR>")

vim.cmd[[
function! MdpOpenPreview(url) abort
let l:mdp_browser = '/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe'
let l:mdp_browser_opts = '--new-window'
if !filereadable(substitute(l:mdp_browser, '\\ ', ' ', 'g'))
  let l:mdp_browser = '/mnt/c/Program\ Files\ \(x86\)/Microsoft/Edge/Application/msedge.exe'
  let l:mdp_browser_opts = '--new-window'
  endif
  execute join(['silent! !', l:mdp_browser, l:mdp_browser_opts, a:url])
  redraw!
  endfunction

  let g:mkdp_browserfunc = 'MdpOpenPreview'
]]

-- Setup the colorschemes
vim.cmd("colorscheme kanagawa")

local cmp = require'cmp'
local luasnip = require("luasnip")
  cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    view = {
      docs = {
        auto_open = true
      }
    },
    mapping = cmp.mapping.preset.insert({
      -- Scroll documentation
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
              if luasnip.expandable() then
                  luasnip.expand()
              else
                  cmp.confirm({
                      select = true,
                  })
              end
          else
              fallback()
          end
      end
  ), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()


vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- Setup LSP servers
-- C/C++ related LSPs
vim.lsp.enable('clangd')

vim.lsp.config.clangd = {
    cmd = {
        "clangd",
        "--background-index",
        "--query-driver=**/*xtensa-esp32*-elf-g*", -- Matches your ESP-IDF gcc/g++ compiler
    },
}
vim.lsp.enable('cmake')
-- HTML
vim.lsp.enable('html')
-- Lua
-- vim.lsp.enable('lua_ls.lua')
-- Python
vim.lsp.enable('pyright')
-- Typescript
vim.lsp.enable('ts_ls')
-- Vim
vim.lsp.enable('vimls')
-- Golang
vim.lsp.enable('gopls')
