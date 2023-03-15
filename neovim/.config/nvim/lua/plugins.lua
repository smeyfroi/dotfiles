local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

opts = {
  install = {
    missing = true,            -- install missing plugins on startup.
  },
  change_detection = {
    enabled = true, -- check for config file changes
    notify = true,  -- get a notification when changes are found
  },
}
require('lazy').setup({{import='plugins-enabled'}}, opts)
