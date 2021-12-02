-- Colorscheme name:    mycolor.nvim
-- Description:         Port of articicestudio's nord theme for neovim
-- Author:              https://github.com/disk7

local util = require('mycolor.util')

-- Load the theme
local set = function ()
  util.load()
end

return { set = set }
