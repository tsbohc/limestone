-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

local lush = require('lush')
local hsl = lush.hsl

local italic = "italic"
local bold = "bold"

local ice = {
  black   = hsl(0,   0,   16),    -- gruv 16
  pitch   = hsl(0,   0,   27),
  metal   = hsl(0,   0,   33),
  ashes   = hsl(30,  0,   49),   -- gruv 51
  chalk   = hsl(48,  0,   83),   -- gruv 88
  snowy   = hsl(0,   0,   92),

  red     = hsl(345, 53,  77),
  yellow  = hsl(40,  49,  73),
  green   = hsl(140, 25,  73),
  cyan    = hsl(175, 36,  72),
  blue    = hsl(209, 40,  72),
  magenta = hsl(285, 30,  76),
}

local gre = {
  black   = hsl(240, 1,   17),    -- gruv 16
  pitch   = hsl(240, 1,   30),
  metal   = hsl(207, 5,   32),
  ashes   = hsl(202, 3,   50),   -- gruv 51
  chalk   = hsl(120, 3,   83),   -- gruv 88
  snowy   = hsl(0,   0,   94),

  red     = hsl(345, 58,  77),
  yellow  = hsl(40,  54,  73),
  green   = hsl(140, 30,  73),
  cyan    = hsl(175, 41,  72),
  blue    = hsl(209, 45,  72),
  magenta = hsl(285, 35,  76),
}

local current = gre

local p = {
  black = current.black,
  black1 = current.black.li(2),
  black2 = current.black.li(4),
  black3 = current.black.li(6),

  pitch = current.pitch,
  metal = current.metal,
  ashes = current.ashes,
  chalk = current.chalk,
  snowy = current.snowy,

  accent = current.blue.li(50).sa(50),
  search = current.yellow,

  red = current.red,
  red_b = hsl(345, 90, 70),
  yellow = current.yellow,
  green = current.green,
  cyan = current.cyan,
  blue = current.blue,
  magenta = current.magenta,

  test = hsl(297, 100, 50)
}


local theme = lush(function()
  return {
    Comment      { fg = p.pitch, gui = italic }, -- any comment
    ColorColumn  { bg = p.black2 }, -- used for the columns set with 'colorcolumn'
    Conceal      { fg = p.black3 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = p.black2 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { CursorColumn }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = p.green }, -- directory names (and other special names in listings)
    DiffAdd      { fg = p.green }, -- diff mode: Added line |diff.txt|
    DiffChange   { fg = p.yellow }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { fg = p.red }, -- diff mode: Deleted line |diff.txt|
    DiffText     { fg = p.blue }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg = p.black }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    ErrorMsg     { fg = p.black, bg = p.red, gui = bold }, -- error messages on the command line
    VertSplit    { fg = p.pitch }, -- the column separating vertically split windows
    Folded       { fg = p.ashes}, -- line used for closed folds
    FoldColumn   { }, -- 'foldcolumn'
    SignColumn   { }, -- column where |signs| are displayed
    IncSearch    { fg = p.black, bg = p.magenta }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { IncSearch }, -- |:substitute| replacement text highlighting
    LineNr       { fg = p.pitch }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = p.chalk }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = p.red_b, gui = bold }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { fg = p.metal }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = p.green }, -- |more-prompt|
    NonText      { fg = p.metal }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = p.chalk, bg = p.black }, -- normal text
    NormalFloat  { Normal }, -- Normal text in floating windows.
    NormalNC     { Normal }, -- normal text in non-current windows
    Pmenu        { bg = p.black1, fg = p.ashes }, -- Popup menu: normal item.
    PmenuSel     { bg = p.black3, fg = p.snowy }, -- Popup menu: selected item.
    PmenuSbar    { bg = p.black }, -- Popup menu: scrollbar.
    PmenuThumb   { PmenuSbar }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = p.green }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { IncSearch }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { fg = p.black, bg = p.blue }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- StatusLine   { }, -- status line of current window
    -- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- tab pages line, not active tab page label
    -- TabLineFill  { }, -- tab pages line, where there are no labels
    -- TabLineSel   { }, -- tab pages line, active tab page label
    Title        { fg = p.magenta }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = p.black3 }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = p.red }, -- warning messages
    Whitespace   { Conceal }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu     { }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { fg = p.chalk }, -- (preferred) any constant
    String         { fg = p.ashes }, --   a string constant: "this is a string"
    Character      { fg = p.accent }, --  a character constant: 'c', '\n'
    -- Number         { }, --   a number constant: 234, 0xff
    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10

    Identifier     { fg = p.chalk }, -- (preferred) any variable name
    Function       { fg = p.accent }, -- function name (also: methods for classes)

    Statement      { fg = p.ashes, gui = italic }, -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    Operator       { fg = p.ashes }, -- "sizeof", "+", "*", etc.
    -- Keyword        { }, --  any other keyword
    -- Exception      { }, --  try, catch, throw

    PreProc        { fg = p.test, gui = italic}, -- (preferred) generic Preprocessor
    Include        { fg = p.ashes, gui = italic }, --  preprocessor #include
    Define         { Include }, --   preprocessor #define
    Macro          { Include }, --    same as Define
    PreCondit      { Include }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = p.chalk }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    Special        { }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold       { gui = "bold" },
    Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error          { fg = p.red }, -- (preferred) any erroneous construct

    Todo           { fg = p.yellow }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- {{{ LSP
    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    -- LspReferenceText                     { }, -- used for highlighting "text" references
    -- LspReferenceRead                     { }, -- used for highlighting "read" references
    -- LspReferenceWrite                    { }, -- used for highlighting "write" references

    -- LspDiagnosticsDefaultError           { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultWarning         { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultInformation     { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultHint            { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    -- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
    -- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
    -- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
    -- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

    -- LspDiagnosticsUnderlineError         { }, -- Used to underline "Error" diagnostics
    -- LspDiagnosticsUnderlineWarning       { }, -- Used to underline "Warning" diagnostics
    -- LspDiagnosticsUnderlineInformation   { }, -- Used to underline "Information" diagnostics
    -- LspDiagnosticsUnderlineHint          { }, -- Used to underline "Hint" diagnostics

    -- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column
    -- }}}

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation         { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute          { };    -- (unstable) TODO: docs
    -- TSBoolean            { };    -- For booleans.
    -- TSCharacter          { };    -- For characters.
    -- TSComment            { };    -- For comment blocks.
    -- TSConstructor        { };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    TSConditional        { Statement };    -- For keywords related to conditionnals.
    TSConstant           { Constant };    -- For constants
    -- TSConstBuiltin       { };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { };    -- For constants that are defined by macros: `NULL` in C.
    TSError              { Error };    -- For syntax/parser errors.
    -- TSException          { };    -- For exception related keywords.
    -- TSField              { };    -- For fields.
    -- TSFloat              { };    -- For floats.
    TSFunction           { Function };    -- For function (calls and definitions).
    TSFuncBuiltin        { fg = p.snowy };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSKeyword            { };    -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { };    -- For keywords used to define a fuction.
    -- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
    TSMethod             { Function };    -- For method calls and definitions.
    -- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
    -- TSNone               { };    -- TODO: docs
    -- TSNumber             { };    -- For all numbers
    -- TSOperator           { };    -- For any operator: `+`, but also `->` and `*` in C.
    -- TSParameter          { };    -- For parameters of a function.
    -- TSParameterReference { };    -- For references to parameters of a function.
    -- TSProperty           { };    -- Same as `TSField`.
    TSPunctDelimiter     { fg = p.ashes };    -- For delimiters ie: `.`
    TSPunctBracket       { fg = p.metal };    -- For brackets and parens.
    TSPunctSpecial       { TSPunctBracket };    -- For special punctutation that does not fall in the catagories before.
    TSRepeat             { Statement };    -- For keywords related to loops.
    TSString             { String };    -- For strings.
    -- TSStringRegex        { };    -- For regexes.
    -- TSStringEscape       { };    -- For escape characters within a string.
    -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
    -- TSType               { };    -- For types.
    -- TSTypeBuiltin        { };    -- For builtin types.
    TSVariable           { Identifier };    -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { };    -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag                { };    -- Tags like html tag names.
    -- TSTagDelimiter       { };    -- Tag delimiter like `<` `>` `/`
    -- TSText               { };    -- For strings considered text in a markup language.
    -- TSEmphasis           { };    -- For text to be represented with emphasis.
    -- TSUnderline          { };    -- For text to be represented with an underline.
    -- TSStrike             { };    -- For strikethrough text.
    -- TSTitle              { };    -- Text that is part of a title.
    -- TSLiteral            { };    -- Literal text.
    -- TSURI                { };    -- Any URI like a link or email.

  }
end)

return theme

-- vi:nowrap
