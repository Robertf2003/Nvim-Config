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

-- Set up coc extentsions
vim.g.coc_global_extensions = {"coc-json", "coc-clangd"}
-- Set up coc key mappings
vim.cmd("inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : \"\\<C-g>u\\<TAB>\"")
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
