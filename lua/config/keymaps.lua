-- ~/.config/nvim/lua/config/keymaps.lua
vim.keymap.set({ "n", "i", "v" }, "<D-s>", function()
  vim.cmd("w")
  -- Сохраняем файл
  -- Автоформатирование после сохранения
  if vim.g.autoformat ~= false then
    vim.defer_fn(function()
      vim.lsp.buf.format({ async = true })
    end, 100)
  end
end, { desc = "Save file with Command+S" })

-- Go-специфичные ключи
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<cr>", { desc = "Run Go test" })
    vim.keymap.set("n", "<leader>gc", "<cmd>GoCoverage<cr>", { desc = "Run coverage" })
    vim.keymap.set("n", "<leader>gd", "<cmd>GoDebug<cr>", { desc = "Start debugger" })
  end,
})
vim.keymap.set("n", "<leader>gt", "<cmd>GoAddTags<cr>", { desc = "Add tags" })
