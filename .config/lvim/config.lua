--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

---------------------------------------------------------------------
-- Fundamentals
---------------------------------------------------------------------
-- vim
vim.opt.background = "dark" -- tell vim what the background color looks like
vim.opt.backspace = "start,eol,indent"
vim.opt.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.opt.cmdheight = 2 -- More space for displaying messages
-- vim.opt.completeopt = menu,menuone,noselect
vim.opt.encoding = "utf-8" -- The encoding displayed
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.fileencoding = "utf-8" -- The encoding written to file
vim.opt.fileencodings = "utf-8,sjis,euc-jp,latin"
vim.opt.fileformats = "unix,dos,mac" -- Automatic recognition of line feed code
vim.opt.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- Ignore case for search
vim.opt.iskeyword:append('-') -- treat dash separated words as a word text object
vim.opt.laststatus = 2 -- Always display the status line
-- vim.opt.list lcs = tab:\ \" -- Put cursor in the head of tab char. Notes) Therea is the extra space after the second '\'.
vim.opt.mouse = 'a' -- Enable your mouse
vim.opt.wrap = true -- Display long lines as wrap
vim.opt.number = false -- Enable your mouse
vim.opt.ruler = true -- Show the cursor position all the time
vim.opt.relativenumber = true -- Line relative numbers
-- vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4 -- Change the number of space characters inserted for indentation
vim.opt.showcmd = true
vim.opt.showtabline = 2 -- Always show tabs
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true -- Makes indenting smart
vim.opt.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.softtabstop = 4
-- vim.opt.splitbelow = true -- Horizontal splits will automatically be below
-- vim.opt.splitright = true -- Vertical splits will automatically be to the right
vim.opt.statusline = "%f%m%=%l,%c\\ %{'['.(&fenc!=''?&fenc:&enc).']\\ ['.&fileformat.']'}"
vim.opt.tabstop = 4 -- Insert 2 spaces for a tab
vim.opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms
vim.opt.title = true
vim.opt.updatetime = 300 -- Faster completion
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"

vim.opt.inccommand = "split" -- incremental substitution (neovim)

-- lvim
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "mynord"
lvim.colorscheme = "mynord"
lvim.transparent_window = true
lvim.line_wrap_cursor_movement = false

---------------------------------------------------------------------
-- Key Mappings
---------------------------------------------------------------------
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "\\"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
  --nmap <C-w> <C-w>
lvim.keys.normal_mode["<C-w>"] = "<C-w>"
lvim.keys.insert_mode["jj"] = nil
lvim.keys.insert_mode["kj"] = nil
lvim.keys.insert_mode["jk"] = nil
lvim.keys.visual_mode["<"] = nil
lvim.keys.visual_mode[">"] = nil
-- lvim.keys.normal_mode["<leader>q"] = ""

-- set leader key
vim.cmd([[
  let g:mapleader = "\<Space>"
]])

-- Better cursor move
lvim.keys.insert_mode["<C-h>"] = "<Left>"
lvim.keys.insert_mode["<C-j>"] = "<Down>"
lvim.keys.insert_mode["<C-k>"] = "<Up>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"
lvim.keys.normal_mode["<C-h>"] = "<Left>"
lvim.keys.normal_mode["<C-j>"] = "<Down>"
lvim.keys.normal_mode["<C-k>"] = "<Up>"
lvim.keys.normal_mode["<C-l>"] = "<Right>"
lvim.keys.command_mode = {
  ["<C-h>"] = { "<Left>", { expr = false, noremap = true }, },
  ["<C-l>"] = { "<Right>", { expr = false, noremap = true }, },
  ["<C-j>"] = { "<Down>", { expr = false, noremap = true }, },
  ["<C-k>"] = { "<Up>", { expr = false, noremap = true }, },
}
lvim.keys.term_mode["<C-h>"] = "<Left>"
lvim.keys.term_mode["<C-j>"] = "<Down>"
lvim.keys.term_mode["<C-k>"] = "<Up>"
lvim.keys.term_mode["<C-l>"] = "<Right>"
lvim.keys.term_mode["<C-n>"] = "<Down>"
lvim.keys.term_mode["<C-p>"] = "<Up>"

-- Remove highlight
lvim.keys.normal_mode["<Esc><Esc>"] = ":<C-u>noh<CR>"

-- Paste
vim.cmd([[
  nnoremap <expr><silent> <A-p>   getregtype() ==# 'V' ? 'p' : 'o<Esc>p'
  nnoremap <expr><silent> <S-A-p> getregtype() ==# 'V' ? '<S-p>' : 'O<Esc>p'
]])
lvim.keys.insert_mode["<C-v>"] = "<C-r>*"

-- Select all
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"

-- Increment/decrement
lvim.keys.normal_mode["+"] = "<C-a>"
lvim.keys.normal_mode["-"] = "<C-x>"

-- Easy CAPS
lvim.keys.insert_mode["<A-PageUp>"] = "<ESC>viwUi"
lvim.keys.normal_mode["<A-PageUp>"] = "viwU<Esc>"
lvim.keys.insert_mode["<A-PageDown>"] = "<ESC>viwui"
lvim.keys.normal_mode["<A-PageDown>"] = "viwu<Esc>"

-- Resize window
lvim.keys.normal_mode["<C-A-h>"] = "<C-w><"
lvim.keys.normal_mode["<C-A-l>"] = "<C-w>>"
lvim.keys.normal_mode["<C-A-k>"] = "<C-w>+"
lvim.keys.normal_mode["<C-A-j>"] = "<C-w>-"

-- Quick list
vim.cmd([[
  nnoremap <Leader>q :copen<CR>
  nnoremap <Leader>z :cclose<CR>
]])

-- Location list
vim.cmd([[
  nnoremap <Leader>o :lopen<CR>
  nnoremap <Leader>c :lclose<CR>
]])

-- Delete recording key
lvim.keys.normal_mode["qq"] = "<NOP>"

-- Line number toggle
vim.cmd([[
  nnoremap <silent> <F11> :set norelativenumber \| set invnumber<CR>
]])

-- Relative line number toggle
vim.cmd([[
  nnoremap <silent> <F12> :set nonumber \| set invrelativenumber<CR>
]])

-- Save with root permission
vim.cmd([[
  command! W w !sudo tee > /dev/null %
]])

-- Tab
vim.cmd([[
  " The prefix key.
  nnoremap    [Tag]   <Nop>
  " Tab jump
  nmap    t [Tag]
  " t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
  for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
  endfor

  " New tab (most right)
  nnoremap <silent> [Tag]t :<C-u> $tabnew<CR>
  " Close tab
  nnoremap <silent> [Tag]w :<C-u> tabclose<CR>
  " Next tab
  nnoremap <silent> [Tag]l :<C-u> tabnext<CR>
  " Previous tab
  nnoremap <silent> [Tag]h :<C-u> tabprevious<CR>
]])

-- Terminal
vim.cmd([[
  " New terminal (most right)
  nnoremap <silent> t\ :<C-u> $tabnew \| terminal<CR>
  " New split terminal
  nnoremap <silent> ts :split \| resize 20 \| terminal<CR>
  " New vsplit terminal
  nnoremap <silent> tv :vsplit \| terminal<CR>

  tnoremap <Esc> <C-\><C-n>
  autocmd TermOpen * startinsert
]])

-- Commentary
vim.cmd([[
  nnoremap <Tab><Tab> :Commentary<CR>
  vnoremap <Tab><Tab> :Commentary<CR>
]])

-- Telescope
vim.cmd([[
  nnoremap <silent>ff :Telescope find_files prompt_prefix=🔍<CR>
  nnoremap <silent>fd :Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>
  nnoremap f<Space> :Telescope find_files prompt_prefix=🔍 search_dirs=
  nnoremap <silent><Leader>g :Telescope live_grep<CR>
  nnoremap <silent>\\ :Telescope buffers<CR>

  command! -nargs=1 FF call Find_files(<f-args>)
  command! -nargs=1 FD call Find_dotfiles(<f-args>)

  function! Find_files(path)
    exec 'Telescope find_files prompt_prefix=🔍 find_command=rg,--files,' . expand(a:path)
  endfunction
  function! Find_dotfiles(path)
    exec 'Telescope find_files prompt_prefix=🔍 find_command=rg,--ignore,--hidden,--files,' . expand(a:path)
  endfunction
]])

---------------------------------------------------------------------
-- Plugins
---------------------------------------------------------------------
-- Additional Plugins
lvim.plugins = {
    {'arcticicestudio/nord-vim'},
    {'shaunsingh/nord.nvim'},
    {'edeneast/nightfox.nvim'},
    {'itchyny/lightline.vim'},
    {'folke/tokyonight.nvim'},
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {'tpope/vim-commentary'},
    {'ray-x/lsp_signature.nvim'},
    {'norcalli/nvim-colorizer.lua'},
    {'dart-lang/dart-vim-plugin'},
}

---------------------------------------------------------------------
-- Plugin Configuration
---------------------------------------------------------------------
-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.lualine.active = false
lvim.builtin.bufferline.active = false

---------------------------------------------------------------------
-- Telescope
---------------------------------------------------------------------
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<C-d>"] = "cycle_history_next",
    ["<C-u>"] = "cycle_history_prev",
    ["<CR>"] = "select_tab",
  },
  -- for normal mode
  n = {
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<CR>"] = "select_tab",
  },
}

---------------------------------------------------------------------
-- WhichKey
---------------------------------------------------------------------
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }
lvim.builtin.which_key.mappings.c = nil
lvim.builtin.which_key.mappings.h = nil
lvim.builtin.which_key.mappings.q = nil

---------------------------------------------------------------------
-- Project
---------------------------------------------------------------------
lvim.builtin.project.manual_mode = true
lvim.builtin.project.show_hidden = true
lvim.builtin.project.silent_chdir = false

---------------------------------------------------------------------
-- Treesitter
---------------------------------------------------------------------
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
  "go",
  "dart",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

---------------------------------------------------------------------
-- LSP
---------------------------------------------------------------------
-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black", filetypes = { "python" } },
--   { exe = "isort", filetypes = { "python" } },
--   {
--     exe = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "flake8", filetypes = { "python" } },
--   {
--     exe = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--severity", "warning" },
--   },
--   {
--     exe = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

function goimports(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end

require'lspconfig'.dartls.setup{}

---------------------------------------------------------------------
-- LSP Signature
---------------------------------------------------------------------
require"lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  },
  -- fix_pos = false,
  -- hint_enable = false,
  hint_prefix = " 💡 ",
  -- use_lspsaga = false,
  auto_close_after = nil,
})

---------------------------------------------------------------------
-- Colorlizer
---------------------------------------------------------------------
require'colorizer'.setup(
  {'*';},
  {
      RGB      = true;         -- #RGB hex codes
	  RRGGBB   = true;         -- #RRGGBB hex codes
	  names    = false;         -- "Name" codes like Blue
	  RRGGBBAA = false;         -- #RRGGBBAA hex codes
	  rgb_fn   = true;         -- CSS rgb() and rgba() functions
	  hsl_fn   = false;         -- CSS hsl() and hsla() functions
	  css      = false;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	  css_fn   = false;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
  })

---------------------------------------------------------------------
-- StatusLine
---------------------------------------------------------------------
vim.cmd([[
  " StatusLine colorscheme
  let g:lightline = {
      \  'colorscheme': 'disk7',
      \  'inactive': {
      \    'left': [ ['filename', 'modified' ] ],
      \  },
      \}
]])


---------------------------------------------------------------------
-- Dart
---------------------------------------------------------------------
vim.cmd([[
  " Dart autoformat
  let g:dart_format_on_save = 1
]])

---------------------------------------------------------------------
-- Autocommands
---------------------------------------------------------------------
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
lvim.autocommands._general_settings[2] = nil
-- lvim.autocommands._general_settings["1"]["1"] = "FileType"
-- lvim.autocommands._general_settings["1"]["2"] = "qf,help,man"
-- lvim.autocommands._general_settings["1"]["3"] = "nnoremap <silent> <buffer> q :close<CR>"
-- lvim.autocommands._general_settings["2"]["1"] = "BufWritePost"
-- lvim.autocommands._general_settings["2"]["2"] = "/home/shimauchi/.config/lvim/config.lua"
-- lvim.autocommands._general_settings["2"]["3"] = "lua require('lvim.config'):reload()"
-- lvim.autocommands._general_settings["3"]["1"] = "FileType"
-- lvim.autocommands._general_settings["3"]["2"] = "qf"
-- lvim.autocommands._general_settings["3"]["3"] = "set nobuflisted"
lvim.autocommands.cursor_highlight = {
  { "WinEnter", "*", "set cursorline" },
  { "WinLeave", "*", "set nocursorline" },
}
lvim.autocommands.import = {
  { "BufWritePre", "*.go", "lua goimports(1000)"},
}
lvim.autocommands.colorscheme = {
  { "ColorScheme", "*", "highlight Normal ctermbg=none guibg=none" },
  { "ColorScheme", "*", "highlight SignColumn ctermbg=none guibg=none" },
  { "ColorScheme", "*", "highlight LineNr ctermbg=none guifg=#777777 guibg=none" },
  { "ColorScheme", "*", "highlight CursorLineNr ctermbg=none guifg=#777777 guibg=none" },
  { "ColorScheme", "*", "highlight CursorLine ctermbg=none guifg=none guibg=#3b4451" },
  { "ColorScheme", "*", "highlight Comment ctermbg=none guifg=#777777 guibg=none" },
  { "ColorScheme", "*", "highlight Visual ctermbg=none guifg=none guibg=#5c6168" },
  { "ColorScheme", "*", "highlight IncSearch ctermbg=none guifg=#ffffff guibg=#ff2255"},
  { "ColorScheme", "*", "highlight Search ctermbg=none guifg=#3b4252 guibg=#ebcb8b" },
}
lvim.autocommands.indent = {
  { "BufWinEnter", "*.lua", "setlocal ts=2 sw=2" },
  { "BufWinEnter", "*.html", "setlocal ts=2 sw=2" },
  { "BufWinEnter", "*.js", "setlocal ts=2 sw=2" },
  { "BufWinEnter", "*.css", "setlocal ts=2 sw=2" },
  { "BufWinEnter", "*.dart", "setlocal ts=2 sw=2" },
}
