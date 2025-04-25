local o = vim.opt
-- general 
o.swapfile = false
-- indentation
o.expandtab = true   -- Turns tabs into space
o.shiftwidth = 2     -- shift 4 spaces when tab
o.tabstop = 2        -- 1 tab == 2 spaces
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

vim.keymap.set("n", "<F5>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F6>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F7>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F8>", ":lua require'dap'.step_into()<CR>")

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
vim.cmd("colorscheme citruszest")

local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.

        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
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
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

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

-- Setup LSP servers

-- C/C++ related LSPs
vim.lsp.enable('clangd')
vim.lsp.enable('cmake')
-- HTML
vim.lsp.enable('html')
-- Lua
vim.lsp.enable('lua_ls.lua')
-- Python
vim.lsp.enable('pyright')
-- Typescript
vim.lsp.enable('ts_ls')
-- Vim
vim.lsp.enable('vimls')

