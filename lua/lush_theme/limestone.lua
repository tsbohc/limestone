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

local lush = require('lush')
local hsl = lush.hsl

-- 240h purple and 190h green
-- light mode?!

local italic = "italic"
local bold = "bold"
local underline = "underline"

-- background
local base00 = hsl(240, 3, 14) -- default background
--local base00 = hsl(210, 5, 12) -- default background
local base01 = hsl(240, 1, 18) -- line highlighting background
local base02 = hsl(240, 1, 20) -- selection background

-- foreground
local base10 = hsl(8,   8, 88)   -- functions
local base11 = hsl(240, 4, 70)   -- default foreground, variables, dot-delimiter
local base13 = hsl(23,  2, 58)   -- strings, string constants
local base12 = hsl(240, 5, 46)   -- keywords, folds
local base14 = hsl(230, 7, 30)   -- parens

local base21 = hsl(227, 3, 30) -- comments
local base20 = hsl(230, 4, 25) -- invisibles

local base0I = hsl(209, 40,  75) -- info
local base0W = hsl(285, 30,  77) -- warning

--local base06 = hsl() -- Light Foreground (Not often used)
--local base07 = hsl() -- Light Background (Not often used)
--local base08 = hsl() -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
--local base09 = hsl() -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
--local base0A = hsl() -- Classes, Markup Bold, Search Text Background
--local base0B = hsl() -- Strings, Inherited Class, Markup Code, Diff Inserted
--local base0C = hsl() -- Support, Regular Expressions, Escape Characters, Markup Quotes
--local base0D = hsl() -- Functions, Methods, Attribute IDs, Headings
--local base0E = hsl() -- Keywords, Storage, Selector, Markup Italic, Diff Changed
--local base0F = hsl() -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

local theme = lush(function()
  return {
    X { lush = {
        background = base00,
        foreground = base11,
        color0 = base00,
        color1 = hsl(345, 53,  77),
        color2 = hsl(140, 25,  73),
        color3 = hsl(40,  49,  73),
        color4 = hsl(209, 40,  72),
        color5 = hsl(285, 30,  76),
        color6 = hsl(175, 36,  72),
        color7 = base11,
        color8 = base11,
        color9 = hsl(345, 53,  77),
        color10 = hsl(140, 25,  73),
        color11 = hsl(40,  49,  73),
        color12 = hsl(209, 40,  72),
        color13 = hsl(285, 30,  76),
        color14 = hsl(175, 36,  72),
        color15 = base11,
      }
    },


    Comment      { fg = base21, gui = italic }, -- any comment
    ColorColumn  { bg = base01 }, -- used for the columns set with 'colorcolumn'
    Conceal      { fg = base20 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = base01 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = base01 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = base12 }, -- directory names (and other special names in listings)
    netrwClassify { fg = base14 },
    DiffAdd      { fg = base0I }, -- diff mode: Added line |diff.txt|
    DiffChange   { fg = base12 }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { fg = base0W }, -- diff mode: Deleted line |diff.txt|
    DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|
    diffRemoved  { DiffDelete },
    diffAdded    { DiffAdd },
    EndOfBuffer  { fg = base00 }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    ErrorMsg     { fg = base00, bg = base0W, gui = italic }, -- error messages on the command line
    VertSplit    { fg = base20 }, -- the column separating vertically split windows
    Folded       { fg = base12, gui = italic }, -- line used for closed folds
    FoldColumn   { fg = base12, bg = base00 }, -- 'foldcolumn'
    SignColumn   { bg = base00 }, -- column where |signs| are displayed
    IncSearch    { fg = base00, bg = base0W, gui = italic }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { fg = base00, bg = base0W }, -- |:substitute| replacement text highlighting
    LineNr       { fg = base20 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = base11 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = base0W, gui = bold }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = base0I, gui = italic }, -- |more-prompt|
    NonText      { fg = base20 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = base11, bg = base00 }, -- normal text
    NormalFloat  { fg = base11, bg = base00 }, -- Normal text in floating windows.
    NormalNC     { fg = base11, bg = base00 }, -- normal text in non-current windows
    Pmenu        { fg = base12, bg = base01 }, -- Popup menu: normal item.
    PmenuSel     { fg = base0W, bg = base02}, -- Popup menu: selected item.
    PmenuSbar    { fg = base00 }, -- Popup menu: scrollbar.
    PmenuThumb   { fg = base00 }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = base0I, gui = italic }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { fg = base00, bg = base0I, gui = italic }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey   { fg = base0I }, -- Unprintable characters: 	 text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- StatusLine   { }, -- status line of current window
    -- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- tab pages line, not active tab page label
    -- TabLineFill  { }, -- tab pages line, where there are no labels
    -- TabLineSel   { }, -- tab pages line, active tab page label
    Title        { fg = base0W, gui = italic }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = base02 }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = base0W }, -- warning messages
    Whitespace   { fg = base20 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu     { }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { fg = base11 }, -- (preferred) any constant
    String         { fg = base13 }, --   a string constant: "this is a string"
    Character      { fg = base11 }, --  a character constant: 'c', '\n'
    Number         { fg = base11 }, --   a number constant: 234, 0xff
    Boolean        { fg = base10 }, --  a boolean constant: TRUE, false
    Float          { fg = base11 }, --    a floating point constant: 2.3e10

    Identifier     { fg = base11 }, -- (preferred) any variable name
    Function       { fg = base10 }, -- function name (also: methods for classes)

    Statement      { fg = base12 }, -- (preferred) any statement
    Conditional    { fg = base12 }, --  if, then, else, endif, switch, etc.
    Repeat         { fg = base12 }, --   for, do, while, etc.
    Label          { fg = base12 }, --    case, default, etc.
    Operator       { fg = base10 }, -- "sizeof", "+", "*", etc.
    Keyword        { fg = base12 }, --  any other keyword
    Exception      { fg = base12 }, --  try, catch, throw

    PreProc        { fg = base10 }, -- (preferred) generic Preprocessor
    Include        { fg = base10 }, --  preprocessor #include
    --Define         { fg = base10 }, --   preprocessor #define
    --Macro          { fg = base10 }, --    same as Define
    --PreCondit      { fg = base10 }, --  preprocessor #if, #else, #endif, etc.

    packerOutput { fg = base10 },

    Type           { fg = base12 }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    Special        { }, -- (preferred) any special symbol parens
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    Delimiter      { fg = base11 }, --  character that needs attention
    luaTable       { fg = base12 }, -- !!!
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    -- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct

    Todo           { fg = base0I }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

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
    TSConditional        { fg = base12, gui = italic };    -- For keywords related to conditionnals.
    TSConstant           { fg = base13 };    -- For constants
    TSConstBuiltin       { fg = base10 };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError              { };    -- For syntax/parser errors.
    -- TSException          { };    -- For exception related keywords.
    -- TSField              { };    -- For fields.
    -- TSFloat              { };    -- For floats.
    TSFunction           { fg = base10 };    -- For function (calls and definitions).
    -- TSFuncBuiltin        { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword            { fg = base12, gui = italic };    -- For keywords that don't fall in previous categories.
    TSKeywordFunction    { fg = base12, gui = italic };    -- For keywords used to define a fuction.
    -- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod             { };    -- For method calls and definitions.
    -- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
    -- TSNone               { };    -- TODO: docs
    -- TSNumber             { };    -- For all numbers
    -- TSOperator           { };    -- For any operator: `+`, but also `->` and `*` in C.
    -- TSParameter          { };    -- For parameters of a function.
    -- TSParameterReference { };    -- For references to parameters of a function.
    -- TSProperty           { };    -- Same as `TSField`.
    TSPunctDelimiter     { fg = base11 };    -- For delimiters ie: `.`
    TSPunctBracket       { fg = base14 };    -- For brackets and parens.
    -- TSPunctSpecial       { };    -- For special punctutation that does not fall in the catagories before.
    TSRepeat             { fg = base12, gui = italic };    -- For keywords related to loops.
    -- TSString             { };    -- For strings.
    -- TSStringRegex        { };    -- For regexes.
    -- TSStringEscape       { };    -- For escape characters within a string.
    -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
    -- TSType               { };    -- For types.
    -- TSTypeBuiltin        { };    -- For builtin types.
    -- TSVariable           { };    -- Any variable name that does not have another highlight.
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

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
