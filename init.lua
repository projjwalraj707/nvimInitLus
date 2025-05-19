-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },  -- Added by me from https://github.com/catppuccin/nvim
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', --Added by me from https://github.com/nvim-telescope/telescope.nvim
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})




-- Everything from below is added by me

-- Configure themes
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Configure Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Configure Treesitter
--[[ local TSConfig = require('nvim-treesitter.configs')
TSConfig.setup({
	ensure_installed = {'c', 'python', 'javascript'}, -- ensure that parsers for these langs are installed
	highlight = { enable = true },
	indent = { enable = true },
})
]]

-- Configure Neo-tree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {})


-- Configure lualine
require('lualine').setup({
  options = { theme = 'dracula' }
})


-- Configure Custom KeyMappings
local map = vim.keymap.set

-- By default, Ctrl-BS is mapped to Ctrl-h. The below command maps C-h (or in turn C-BS) to C-w (which is by default used to clear text before the curson in insert mode).
map("i", "<C-h>", "<C-w>", { desc = "Ctrl+BackSpace in i mode", remap = true })
map("n", "<C-h>", "a<C-w>", { desc = "Ctrl+Backspace in n mode", remap = true })

-- Remapping Ctrl Delete
map("n", "<C-Del>", "dw", { desc = "Ctrl-Delete in normal mode", remap = true })
map("i", "<C-Del>", "<C-o>dw", { desc = "Ctrl-Delete in insert mode", remap = true })

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = false -- Pressing the TAB key will NOT insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.wo.relativenumber = true
