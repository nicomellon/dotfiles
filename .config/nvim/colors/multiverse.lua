-- Multiverse Computing colorscheme
-- Palette taken from ~/.config/opencode/themes/multiverse.json
-- Respects 'background': `:set background=light` for the light variant.

vim.cmd 'highlight clear'
if vim.fn.exists 'syntax_on' == 1 then vim.cmd 'syntax reset' end
vim.g.colors_name = 'multiverse'

local dark = vim.o.background ~= 'light'

local p = dark
    and {
      primary = '#F01438',
      accent = '#FF4D6A',
      purple = '#A455FF',
      error = '#F01438',
      warning = '#FFC200',
      success = '#00CC66',
      info = '#33BBFF',
      fg = '#F8FAFC',
      muted = '#9BA2AB',
      bg = '#14171A',
      panel = '#181C20',
      element = '#1C2126',
      border = '#4B5158',
      subtle = '#21262B',
      add_bg = '#20303b',
      del_bg = '#37222c',
      chg_bg = '#2a2540',
      sel = '#2d3339',
    }
  or {
    primary = '#F01438',
    accent = '#C01030',
    purple = '#A455FF',
    error = '#C01030',
    warning = '#d68c27',
    success = '#3d9a57',
    info = '#318795',
    fg = '#111417',
    muted = '#5E666E',
    bg = '#F3F5F7',
    panel = '#FFFFFF',
    element = '#F8FAFC',
    border = '#E1E5E9',
    subtle = '#EDF0F3',
    add_bg = '#d5e5d5',
    del_bg = '#f7d8db',
    chg_bg = '#e6dcf5',
    sel = '#D1D6DB',
  }

local hl = function(group, spec) vim.api.nvim_set_hl(0, group, spec) end

-- [[ Editor UI ]]
hl('Normal', { fg = p.fg, bg = p.bg })
hl('NormalNC', { fg = p.fg, bg = p.bg })
hl('NormalFloat', { fg = p.fg, bg = p.panel })
hl('FloatBorder', { fg = p.border, bg = p.panel })
hl('FloatTitle', { fg = p.primary, bg = p.panel, bold = true })
hl('Cursor', { fg = p.bg, bg = p.fg })
hl('lCursor', { link = 'Cursor' })
hl('CursorIM', { link = 'Cursor' })
hl('TermCursor', { link = 'Cursor' })
hl('CursorLine', { bg = p.element })
hl('CursorColumn', { bg = p.element })
hl('ColorColumn', { bg = p.element })
hl('CursorLineNr', { fg = p.primary, bold = true })
hl('LineNr', { fg = p.muted })
hl('SignColumn', { fg = p.muted, bg = p.bg })
hl('FoldColumn', { fg = p.muted, bg = p.bg })
hl('Folded', { fg = p.muted, bg = p.element })
hl('EndOfBuffer', { fg = p.bg })
hl('NonText', { fg = p.border })
hl('Whitespace', { fg = p.subtle })
hl('SpecialKey', { fg = p.border })
hl('Conceal', { fg = p.muted })
hl('VertSplit', { fg = p.border })
hl('WinSeparator', { fg = p.border })
hl('Visual', { bg = p.sel })
hl('VisualNOS', { bg = p.sel })
hl('Search', { fg = p.bg, bg = p.warning })
hl('CurSearch', { fg = p.bg, bg = p.primary, bold = true })
hl('IncSearch', { fg = p.bg, bg = p.primary })
hl('Substitute', { fg = p.bg, bg = p.accent })
hl('MatchParen', { fg = p.primary, bold = true, underline = true })
hl('Directory', { fg = p.info })
hl('Title', { fg = p.accent, bold = true })
hl('Question', { fg = p.info })
hl('MoreMsg', { fg = p.success })
hl('ModeMsg', { fg = p.fg, bold = true })
hl('ErrorMsg', { fg = p.error, bold = true })
hl('WarningMsg', { fg = p.warning })
hl('WildMenu', { fg = p.bg, bg = p.primary })
hl('QuickFixLine', { bg = p.sel, bold = true })

hl('StatusLine', { fg = p.fg, bg = p.panel })
hl('StatusLineNC', { fg = p.muted, bg = p.panel })
hl('TabLine', { fg = p.muted, bg = p.panel })
hl('TabLineFill', { bg = p.panel })
hl('TabLineSel', { fg = p.fg, bg = p.bg, bold = true })
hl('WinBar', { fg = p.fg, bg = p.bg, bold = true })
hl('WinBarNC', { fg = p.muted, bg = p.bg })

hl('Pmenu', { fg = p.fg, bg = p.panel })
hl('PmenuSel', { fg = p.fg, bg = p.sel, bold = true })
hl('PmenuSbar', { bg = p.element })
hl('PmenuThumb', { bg = p.border })

-- [[ Diff ]]
hl('DiffAdd', { bg = p.add_bg })
hl('DiffDelete', { fg = p.accent, bg = p.del_bg })
hl('DiffChange', { bg = p.chg_bg })
hl('DiffText', { bg = p.chg_bg, bold = true })
hl('Added', { fg = p.success })
hl('Removed', { fg = p.accent })
hl('Changed', { fg = p.warning })

-- [[ Spell ]]
hl('SpellBad', { sp = p.error, undercurl = true })
hl('SpellCap', { sp = p.warning, undercurl = true })
hl('SpellLocal', { sp = p.info, undercurl = true })
hl('SpellRare', { sp = p.purple, undercurl = true })

-- [[ Diagnostics ]]
hl('DiagnosticError', { fg = p.error })
hl('DiagnosticWarn', { fg = p.warning })
hl('DiagnosticInfo', { fg = p.info })
hl('DiagnosticHint', { fg = p.purple })
hl('DiagnosticOk', { fg = p.success })
hl('DiagnosticUnderlineError', { sp = p.error, undercurl = true })
hl('DiagnosticUnderlineWarn', { sp = p.warning, undercurl = true })
hl('DiagnosticUnderlineInfo', { sp = p.info, undercurl = true })
hl('DiagnosticUnderlineHint', { sp = p.purple, undercurl = true })
hl('DiagnosticUnderlineOk', { sp = p.success, undercurl = true })
hl('DiagnosticVirtualTextError', { fg = p.error, bg = p.del_bg })
hl('DiagnosticVirtualTextWarn', { fg = p.warning, bg = p.element })
hl('DiagnosticVirtualTextInfo', { fg = p.info, bg = p.element })
hl('DiagnosticVirtualTextHint', { fg = p.purple, bg = p.element })
hl('DiagnosticVirtualTextOk', { fg = p.success, bg = p.add_bg })
hl('DiagnosticDeprecated', { sp = p.muted, strikethrough = true })

-- [[ LSP ]]
hl('LspReferenceText', { bg = p.sel })
hl('LspReferenceRead', { bg = p.sel })
hl('LspReferenceWrite', { bg = p.sel, underline = true })
hl('LspInlayHint', { fg = p.muted, bg = p.element })
hl('LspCodeLens', { fg = p.muted })
hl('LspSignatureActiveParameter', { fg = p.primary, bold = true, underline = true })

-- [[ Syntax (vim) ]]
hl('Comment', { fg = p.muted })
hl('Constant', { fg = p.warning })
hl('String', { fg = p.success })
hl('Character', { fg = p.success })
hl('Number', { fg = p.warning })
hl('Boolean', { fg = p.warning })
hl('Float', { fg = p.warning })
hl('Identifier', { fg = p.fg })
hl('Function', { fg = p.info })
hl('Statement', { fg = p.accent })
hl('Conditional', { fg = p.accent })
hl('Repeat', { fg = p.accent })
hl('Label', { fg = p.accent })
hl('Operator', { fg = p.muted })
hl('Keyword', { fg = p.accent })
hl('Exception', { fg = p.accent })
hl('PreProc', { fg = p.accent })
hl('Include', { fg = p.accent })
hl('Define', { fg = p.accent })
hl('Macro', { fg = p.accent })
hl('PreCondit', { fg = p.accent })
hl('Type', { fg = p.purple })
hl('StorageClass', { fg = p.purple })
hl('Structure', { fg = p.purple })
hl('Typedef', { fg = p.purple })
hl('Special', { fg = p.info })
hl('SpecialChar', { fg = p.warning })
hl('Tag', { fg = p.accent })
hl('Delimiter', { fg = p.fg })
hl('SpecialComment', { fg = p.muted, bold = true })
hl('Debug', { fg = p.warning })
hl('Underlined', { fg = p.info, underline = true })
hl('Ignore', { fg = p.muted })
hl('Error', { fg = p.error })
hl('Todo', { fg = p.bg, bg = p.warning, bold = true })

-- [[ Treesitter ]]
hl('@variable', { fg = p.fg })
hl('@variable.builtin', { fg = p.accent })
hl('@variable.parameter', { fg = p.fg })
hl('@variable.member', { fg = p.fg })
hl('@constant', { fg = p.warning })
hl('@constant.builtin', { fg = p.warning })
hl('@module', { fg = p.fg })
hl('@string', { fg = p.success })
hl('@string.escape', { fg = p.warning })
hl('@string.regexp', { fg = p.warning })
hl('@character', { fg = p.success })
hl('@number', { fg = p.warning })
hl('@boolean', { fg = p.warning })
hl('@type', { fg = p.purple })
hl('@type.builtin', { fg = p.purple })
hl('@attribute', { fg = p.purple })
hl('@property', { fg = p.fg })
hl('@function', { fg = p.info })
hl('@function.builtin', { fg = p.info })
hl('@function.call', { fg = p.info })
hl('@function.method', { fg = p.info })
hl('@function.method.call', { fg = p.info })
hl('@constructor', { fg = p.purple })
hl('@operator', { fg = p.muted })
hl('@keyword', { fg = p.accent })
hl('@keyword.function', { fg = p.accent })
hl('@keyword.return', { fg = p.accent })
hl('@keyword.operator', { fg = p.accent })
hl('@punctuation', { fg = p.fg })
hl('@punctuation.delimiter', { fg = p.muted })
hl('@punctuation.bracket', { fg = p.fg })
hl('@comment', { link = 'Comment' })
hl('@comment.error', { fg = p.error, bold = true })
hl('@comment.warning', { fg = p.warning, bold = true })
hl('@comment.todo', { fg = p.bg, bg = p.warning, bold = true })
hl('@comment.note', { fg = p.info, bold = true })
hl('@tag', { fg = p.accent })
hl('@tag.attribute', { fg = p.warning })
hl('@tag.delimiter', { fg = p.muted })

-- [[ Markup ]]
hl('@markup.heading', { fg = p.accent, bold = true })
hl('@markup.strong', { fg = p.fg, bold = true })
hl('@markup.italic', { fg = p.warning, italic = true })
hl('@markup.strikethrough', { strikethrough = true })
hl('@markup.underline', { underline = true })
hl('@markup.link', { fg = p.info })
hl('@markup.link.label', { fg = p.info })
hl('@markup.link.url', { fg = p.info, underline = true })
hl('@markup.raw', { fg = p.success })
hl('@markup.list', { fg = p.primary })
hl('@markup.quote', { fg = p.muted })
hl('@diff.plus', { fg = p.success })
hl('@diff.minus', { fg = p.accent })
hl('@diff.delta', { fg = p.warning })

-- [[ LSP semantic tokens ]]
hl('@lsp.type.comment', {})
hl('@lsp.type.macro', { link = 'Macro' })
hl('@lsp.type.namespace', { link = '@module' })
hl('@lsp.type.parameter', { link = '@variable.parameter' })
hl('@lsp.type.property', { link = '@property' })
hl('@lsp.type.variable', {})

-- [[ Plugins ]]
-- gitsigns
hl('GitSignsAdd', { fg = p.success })
hl('GitSignsChange', { fg = p.warning })
hl('GitSignsDelete', { fg = p.accent })

-- telescope
hl('TelescopeNormal', { fg = p.fg, bg = p.panel })
hl('TelescopeBorder', { fg = p.border, bg = p.panel })
hl('TelescopeTitle', { fg = p.primary, bold = true })
hl('TelescopePromptPrefix', { fg = p.primary })
hl('TelescopeSelection', { fg = p.fg, bg = p.sel })
hl('TelescopeSelectionCaret', { fg = p.primary, bg = p.sel })
hl('TelescopeMatching', { fg = p.primary, bold = true })

-- which-key
hl('WhichKey', { fg = p.accent })
hl('WhichKeyGroup', { fg = p.info })
hl('WhichKeyDesc', { fg = p.fg })
hl('WhichKeySeparator', { fg = p.muted })
hl('WhichKeyNormal', { link = 'NormalFloat' })

-- blink.cmp
hl('BlinkCmpMenu', { link = 'Pmenu' })
hl('BlinkCmpMenuSelection', { link = 'PmenuSel' })
hl('BlinkCmpMenuBorder', { link = 'FloatBorder' })
hl('BlinkCmpLabelMatch', { fg = p.primary, bold = true })
hl('BlinkCmpDoc', { link = 'NormalFloat' })
hl('BlinkCmpDocBorder', { link = 'FloatBorder' })

-- todo-comments / indent / render-markdown
hl('IblIndent', { fg = p.subtle })
hl('IblScope', { fg = p.border })
hl('RenderMarkdownCode', { bg = p.panel })
hl('RenderMarkdownH1Bg', { fg = p.accent, bg = p.del_bg })
hl('RenderMarkdownBullet', { fg = p.primary })

-- terminal colors
vim.g.terminal_color_0 = p.element
vim.g.terminal_color_1 = p.error
vim.g.terminal_color_2 = p.success
vim.g.terminal_color_3 = p.warning
vim.g.terminal_color_4 = p.info
vim.g.terminal_color_5 = p.purple
vim.g.terminal_color_6 = p.info
vim.g.terminal_color_7 = p.fg
vim.g.terminal_color_8 = p.muted
vim.g.terminal_color_9 = p.accent
vim.g.terminal_color_10 = p.success
vim.g.terminal_color_11 = p.warning
vim.g.terminal_color_12 = p.info
vim.g.terminal_color_13 = p.purple
vim.g.terminal_color_14 = p.info
vim.g.terminal_color_15 = p.fg
