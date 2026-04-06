local ok, process = pcall(require, "neogit.buffers.process")
if ok and process and process.open then
  local original_open = process.open
  process.open = function(self)
    local existing = vim.fn.bufnr("NeogitConsole")
    if existing ~= -1 then
      local buftype = vim.api.nvim_get_option_value("buftype", { buf = existing })
      if buftype == "terminal" then
        vim.api.nvim_buf_delete(existing, { force = true })
      end
    end
    return original_open(self)
  end
end
