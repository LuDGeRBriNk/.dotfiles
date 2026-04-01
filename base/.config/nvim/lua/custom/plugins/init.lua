-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec

return { -- 1. The Hex/RGB Colorizer
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = true,
          mode = 'background',
        },
      }
    end,
  },
}
