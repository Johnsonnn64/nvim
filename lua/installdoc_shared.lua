-- Config is shared, while plugin updates and runtime files belong to each account.
local M = {}
function M.lazy_options()
  local state = vim.fn.stdpath("state")
  local lock = state .. "/lazy-lock.json"
  vim.fn.mkdir(state, "p")
  local seed = vim.fn.stdpath("config") .. "/lazy-lock.json"
  if vim.fn.filereadable(lock) == 0 and vim.fn.filereadable(seed) == 1 then
    vim.fn.writefile(vim.fn.readfile(seed), lock)
  end
  return { lockfile = lock }
end
return M
