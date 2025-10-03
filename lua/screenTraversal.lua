local function tabControlsSetup()
  vim.keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Add new tab" })
  vim.keymap.set("n", "<leader>tc", "<cmd>tab close<CR>", { desc = "Close current tab" })
  vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<CR>", { desc = "Go to the next tab" })
  vim.keymap.set("n", "<leader>th", "<cmd>tabprevious<CR>", { desc = "Go to the previous tab" })
  vim.keymap.set("n", "<leader>ts", "<cmd>tab split<CR>", { desc = "Opens another tab of the current buffer" })
end

local function windowControlsSetup()
  vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h")
  vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j")
  vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k")
  vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l")

  vim.keymap.set("i", "<A-h>", "<C-\\><C-N><C-w>h")
  vim.keymap.set("i", "<A-j>", "<C-\\><C-N><C-w>j")
  vim.keymap.set("i", "<A-k>", "<C-\\><C-N><C-w>k")
  vim.keymap.set("i", "<A-l>", "<C-\\><C-N><C-w>l")
  
  vim.keymap.set("n", "<A-h>", "<C-w>h")
  vim.keymap.set("n", "<A-j>", "<C-w>j")
  vim.keymap.set("n", "<A-k>", "<C-w>k")
  vim.keymap.set("n", "<A-l>", "<C-w>l")
end

local function setup()
  tabControlsSetup()
  windowControlsSetup()
end
return {setup = setup}
