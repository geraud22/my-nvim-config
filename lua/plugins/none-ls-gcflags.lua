local M = {}

M.run = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(bufnr)
  local ns = vim.api.nvim_create_namespace 'gcflags'

  -- run the command
  local handle = io.popen('go build -gcflags=-m ' .. filepath .. ' 2>&1')
  if not handle then
    return
  end
  local result = handle:read '*a'
  handle:close()

  if not result or result == '' then
    vim.notify 'No gcflags output.'
    vim.diagnostic.reset(ns, bufnr)
    return
  end

  -- parse output
  local diags = {}
  local current_diag = nil
  local bufnr = vim.api.nvim_get_current_buf()
  local bufname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':t') -- just the file name
  local ns = vim.api.nvim_create_namespace 'gcflags'

  for _, line in ipairs(vim.split(result, '\n')) do
    if line ~= '' then
      local parts = vim.split(line, ':')
      if #parts >= 3 and parts[1]:find(bufname, 1, true) then
        -- first 3 parts: file, line, col
        local lnum = tonumber(parts[2])
        local col = tonumber(parts[3])
        if lnum and col then
          -- finish previous diagnostic
          if current_diag then
            table.insert(diags, current_diag)
          end
          -- start new diagnostic
          current_diag = {
            row = lnum - 1,
            col = col - 1,
            source = 'gcflags',
            message = table.concat(parts, ':', 4),
            severity = vim.diagnostic.severity.INFO,
          }
        else
          current_diag = nil
        end
      elseif current_diag then
        -- continuation line
        current_diag.message = current_diag.message .. '\n' .. line
      end
    end
  end

  if current_diag then
    table.insert(diags, current_diag)
  end

  if #diags == 0 then
    vim.notify 'No gcflags issues detected'
    vim.diagnostic.reset(ns, bufnr)
  else
    -- set diagnostics
    vim.diagnostic.set(ns, bufnr, diags, {})
  end
end

M.clear = function()
  local ns = vim.api.nvim_create_namespace 'gcflags'
  local bufnr = vim.api.nvim_get_current_buf()
  vim.diagnostic.reset(ns, bufnr)
end

return M
