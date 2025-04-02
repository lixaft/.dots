local M = {}

--- This function only exists because using the default
--- `vim.lsp.start` does not seem to setup the root directory
--- correctly.
--- @param name string
function M.start(name)
  local cfg = vim.lsp.config[name]
  vim.lsp.start(cfg, {
    reuse_client = cfg.reuse_client,
    _root_markers = cfg.root_markers,
  })
end

return M
