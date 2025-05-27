local function openExplorer()
  currentFilePath = vim.fn.expand('%:p')
  index = currentFilePath:match'^.*()/'
  parentDirectory = string.sub(currentFilePath, 1, index)
  vim.cmd(":!explorer.exe `wslpath -w " .. parentDirectory .. "`")
end

return {openExplorer = openExplorer}
