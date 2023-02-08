local nnoremap = require('nm.helpers').nnoremap
local vnoremap = require('nm.helpers').vnoremap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Open netrw
nnoremap('<leader>pv', vim.cmd.Ex, 'Open netrw')

-- Move lines around
vnoremap('J', ":m '>+1<CR>gv=gv", 'Move line(s) down')
vnoremap('K', ":m '<-2<CR>gv=gv", 'Move line(s) up')

-- Keep selection after indenting
vnoremap('>', '> gv', 'Indent right')
vnoremap('<', '< gv', 'Indent left')

-- Join lines maintaining cursor position
nnoremap('J', 'mzJ`z', '[J]oin line')

-- Navigate keeping cursor in center
nnoremap('<C-d>', '<C-d>zz', 'Navigate [D]own half a page')
nnoremap('<C-u>', '<C-u>zz', 'Navigate [U]p half a page')
nnoremap('n', 'nzzzv', '[N]ext search result')
nnoremap('N', 'Nzzzv', 'Previous search result')

-- Access to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
nnoremap("<leader>Y", [["+Y]], '[Y]ank line to system clipboard')

-- Open git status (vim-fugitive)
nnoremap("<leader>gs", vim.cmd.Git, '[G]it [S]tatus')
