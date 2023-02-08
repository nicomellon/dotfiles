local protected_setup = require('nm.helpers').protected_setup

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
local opts = {
  char = '┊',
  show_trailing_blankline_indent = false,
}
protected_setup('indent_blankline', opts)

