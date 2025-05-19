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
