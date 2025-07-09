-- Loading plugin manager
vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")

-- Load core config
require("options")
require("keymaps")

-- Setup lazy plugin loader and loading plugins
require("lazy").setup("plugins")

