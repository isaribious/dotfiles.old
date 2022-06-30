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
-- vim.opt.completeopt = "menu,menuone,noselect"
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
vim.opt.list = true -- Tab display switch
vim.opt.listchars = { tab = "  " } -- Put cursor in the head of tab char.
vim.opt.mouse = 'a' -- Enable your mouse
vim.opt.wrap = true -- Display long lines as wrap
vim.opt.whichwrap = "" -- Wrap between lines and Move cursor
vim.opt.number = false -- Enable your mouse
vim.opt.ruler = true -- Show the cursor position all the time
vim.opt.relativenumber = true -- Line relative numbers
-- vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4 -- Change the number of space characters inserted for indentation
vim.opt.showcmd = true
vim.opt.showtabline = 2 -- Always show tabs
vim.opt.signcolumn = "yes"
vim.opt.smartindent = false -- Makes indenting smart
vim.opt.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.softtabstop = 4
vim.opt.splitbelow = false -- Horizontal splits will automatically be below
vim.opt.splitright = false -- Vertical splits will automatically be to the right
vim.opt.statusline = "%f%m%=%l,%c\\ %{'['.(&fenc!=''?&fenc:&enc).']\\ ['.&fileformat.']'}"
vim.opt.tabstop = 4 -- Insert 2 spaces for a tab
vim.opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms
vim.opt.title = true
vim.opt.updatetime = 300 -- Faster completion
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"
-- vim.opt.wildmode = "longest:full"

vim.opt.inccommand = "split" -- incremental substitution (neovim)

-- lvim
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "mynord"
lvim.transparent_window = true
-- lvim.line_wrap_cursor_movement = false -- Invalid in lvim master 1.1.13 (nvim v0.7.0)

---------------------------------------------------------------------
-- Key Mappings
---------------------------------------------------------------------
lvim.keys.normal_mode["<C-w>"] = "<C-w>"
-- lvim.keys.normal_mode["<S-h>"] = nil
-- lvim.keys.normal_mode["<S-l>"] = nil
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

-- Delete backword
lvim.keys.insert_mode["<C-y>"] = "<C-o>dw"
lvim.keys.insert_mode["<C-g>"] = "<C-o>d$"

-- Remove highlight
lvim.keys.normal_mode["<Esc><Esc>"] = ":<C-u>noh<CR>"

-- Paste
vim.cmd([[
  nnoremap <expr><silent> <A-p>   getregtype() ==# 'V' ? 'p' : 'o<Esc>p'
  nnoremap <expr><silent> <S-A-p> getregtype() ==# 'V' ? '<S-p>' : 'O<Esc>p'
]])
lvim.keys.insert_mode["<C-v>"] = "<C-r>*"

-- Select all
-- lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"

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

-- Disable recording key
lvim.keys.normal_mode["qq"] = "<NOP>"

-- Disable inserting the character under the cursor
lvim.keys.insert_mode["<C-e>"] = "<NOP>"

-- Quick list
vim.cmd([[
  nnoremap <Leader>l :botright copen<CR>
  nnoremap <Leader>q :cclose<CR>
  nnoremap <C-n> :cnext<CR>
  nnoremap <C-p> :cprevious<CR>
]])

-- Location list
vim.cmd([[
  nnoremap <Leader>o :lopen<CR>
  nnoremap <Leader>c :lclose<CR>
]])

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
-- vim.cmd([[
--   " The prefix key.
--   nnoremap    [Tag]   <Nop>
--   " Tab jump
--   nmap    t [Tag]
--   " t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
--   for n in range(1, 9)
--     execute 'nnoremap <silent> [Tag]'.n  ':<C-u> tabnext'.n.'<CR>'
--   endfor

--   " New tab (most right)
--   nnoremap <silent> [Tag]t :<C-u> $tabnew$<CR>
--   " Close tab
--   nnoremap <silent> [Tag]w :<C-u> tabclose<CR>
--   " Next tab
--   nnoremap <silent> [Tag]l :<C-u> tabnext<CR>
--   " Previous tab
--   nnoremap <silent> [Tag]h :<C-u> tabprevious<CR>
-- ]])
vim.cmd([[
  " The prefix key.
  nnoremap    [Tag]   <Nop>
  " Tab jump
  nmap    t [Tag]
  " t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
  for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n  ':BufferLineGoToBuffer'.n.'<CR>'
  endfor

  " New tab (most right)
  nnoremap <silent> [Tag]t :enew<CR>
  " Close tab
  nnoremap <silent> [Tag]w :bd<CR>
  nnoremap <silent> [Tag]W :%bd<CR>
  " Next tab
  nnoremap <silent> [Tag]l :BufferLineCycleNext<CR>
  nnoremap <silent> [Tag]cl :BufferLineCloseRight<CR>
  nnoremap <silent> [Tag]cL :exec BufferLineCloseRight__()<CR>
  nnoremap <silent> [Tag]q :exec BufferLineCloseExternal__()<CR>
  nnoremap <silent> [Tag]n :tabnext<CR>
  " Previous tab
  nnoremap <silent> [Tag]h :BufferLineCyclePrev<CR>
  nnoremap <silent> [Tag]ch :BufferLineCloseLeft<CR>
  nnoremap <silent> [Tag]cH :exec BufferLineCloseLeft__()<CR>
  nnoremap <silent> [Tag]p :tabprevious<CR>

  nnoremap <silent> <S-l> :BufferLineMoveNext<CR>
  nnoremap <silent> <S-h> :BufferLineMovePrev<CR>

  function! BufferLineCloseRight__()
    :BufferLineCloseRight
    :bd
  endfunction

  function! BufferLineCloseLeft__()
    :BufferLineCloseLeft
    :bd
  endfunction

  function! BufferLineCloseExternal__()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && nvim_buf_get_name(v:val) !~ getcwd()')
    if empty(buffers) | echo "No external buffer" | return | endif
    exe 'bd '.join(buffers, ' ')
  endfunction
]])

-- Terminal
vim.cmd([[
  " New terminal (most right)
  nnoremap <silent> t\ :<C-u> enew \| terminal<CR>
  " New split terminal
  nnoremap <silent> ts :split \| resize 20 \| terminal<CR>
  " New vsplit terminal
  nnoremap <silent> tv :vsplit \| terminal<CR>

  tnoremap <Esc> <C-\><C-n>
  autocmd TermOpen * startinsert
]])

-- Commentary
vim.cmd([[
  nnoremap \\ :Commentary<CR>
  vnoremap \\ :Commentary<CR>
  "nnoremap || :gb<CR>
  "vnoremap || :gb<CR>
  "nnoremap \|\| <Cmd>lua ___comment_call("gbc")<CR>g@$
  "vnoremap \|\| <Cmd>lua ___comment_call("gbc")<CR>g@$
]])

-- Telescope
vim.cmd([[
  nnoremap <silent>;F :Telescope find_files prompt_prefix=🔍<CR>
  nnoremap <silent>;H :Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>
  nnoremap <silent>;G :Telescope live_grep file_command=rg,--column,--line-number,--no-heading,--hidden,--smart-case,.+<CR>
  nnoremap <silent>;\ :Telescope buffers<CR>
  nnoremap <silent>ff :Telescope git_files<CR>
  nnoremap <silent>fs :Telescope git_status<CR>
  nnoremap <silent>fb :Telescope git_branches<CR>
  nnoremap <silent>fc :Telescope git_commits<CR>
]])

-- Fuzzy Finder
vim.cmd([[
  nnoremap <silent> <Leader>f :Files<CR>
  nnoremap <silent> <Leader>g :Rg<CR>
  nnoremap <silent> <Leader>\ :Buffers<CR>
  nnoremap <silent> <Leader>, :Files ~/.config/lvim<CR>
  nnoremap <silent> <Leader>. :Files ~/.local/share/lunarvim<CR>
  nnoremap FF :Files 
  nnoremap FG :Rg 
]])

-- Nvim Tree
vim.cmd([[
  nnoremap <silent> `` :NvimTreeToggle<CR>
]])

-- Diffview
vim.cmd([[
  nnoremap <silent> df :DiffviewOpen -uno<CR>
  nnoremap <silent> dq :DiffviewClose<CR>
  nnoremap <silent> dt :DiffviewToggleFiles<CR>
  nnoremap <silent> dh :DiffviewFileHistory<CR>
]])

-- Gitsigns
vim.cmd([[
  nnoremap <silent> gsh :Gitsigns preview_hunk<CR>
  nnoremap <silent> gsn :Gitsigns next_hunk<CR>
  nnoremap <silent> gsp :Gitsigns prev_hunk<CR>
  nnoremap <silent> gsd :Gitsigns diffthis<CR>
]])

---------------------------------------------------------------------
-- Plugins
---------------------------------------------------------------------
-- Additional Plugins
lvim.plugins = {
  -- { 'arcticicestudio/nord-vim' },
  { 'shaunsingh/nord.nvim' },
  { 'edeneast/nightfox.nvim' },
  { 'folke/tokyonight.nvim' },
  { 'jdkanani/vim-material-theme' },
  -- { 'itchyny/lightline.vim' },
  { 'folke/trouble.nvim', cmd = 'TroubleToggle' },
  { 'tpope/vim-commentary' },
  { 'ray-x/lsp_signature.nvim' },
  { 'norcalli/nvim-colorizer.lua' },
  { 'dart-lang/dart-vim-plugin' },
  { 'hrsh7th/cmp-cmdline' },
  { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' },
  { 'junegunn/fzf.vim' },
  { "sindrets/diffview.nvim" },
}

-- Activation for Core Plugins
lvim.builtin.alpha.active = false
lvim.builtin.which_key.active = false
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.lualine.active = true
lvim.builtin.bufferline.active = true

-- StatusLine
-- vim.cmd([[
--   " StatusLine colorscheme
--   let g:lightline = {
--       \  'colorscheme': 'disk7',
--       \  'inactive': {
--       \    'left': [ ['filename', 'modified' ] ],
--       \  },
--       \}
-- ]])
local components = require "lvim.core.lualine.components"
lvim.builtin.lualine.sections = {
  lualine_a = {
    -- components.mode,
    "mode",
  },
  lualine_b = {
    components.branch,
    components.filename,
  },
  lualine_c = {
    components.diff,
    components.python_env,
  },
  lualine_x = {
    components.diagnostics,
    components.treesitter,
    components.lsp,
    components.filetype,
    "fileformat",
    components.encoding,
  },
  lualine_y = {
    components.progress,
  },
  lualine_z = {
    -- components.scrollbar,
    components.location,
  },
}

-- Buffer Line
lvim.builtin.bufferline.options.numbers = "ordinal"
lvim.builtin.bufferline.options.separator_style = { '|', '|' }

-- Telescope
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    -- ["<C-d>"] = "cycle_history_next",
    -- ["<C-u>"] = "cycle_history_prev",
    -- ["<CR>"] = "select_tab",
    ["<C-l>"] = false,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    -- ["<CR>"] = "select_tab",
  },
}

-- Completion
local cmp = require("cmp")
lvim.builtin.cmp.mapping["<C-d>"] = cmp.mapping.complete()
lvim.builtin.cmp.mapping["<C-f>"] = function() end
lvim.builtin.cmp.mapping["<C-e>"] = cmp.mapping.close()
lvim.builtin.cmp.mapping["<C-c>"] = cmp.mapping.abort()
lvim.builtin.cmp.mapping["<C-j>"] = function() end
lvim.builtin.cmp.mapping["<C-k>"] = function() end
-- cmp.setup.cmdline('/', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline({
--     ["<C-k>"] = cmp.mapping.select_prev_item(),
--     ["<C-j>"] = cmp.mapping.select_next_item(),
--     -- ["<C-d>"] = cmp.mapping.complete(),
--     ["<C-d>"] = cmp.mapping.complete(),
--     -- ["<C-e>"] = cmp.mapping.abort(),

--     ["<CR>"] = cmp.mapping.close(),
--     -- ['<CR>'] = cmp.mapping.confirm({ select = false }),
--   }),
--   sources = cmp.config.sources({
--     -- { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })

-- Diffview
require("diffview").setup({
  hooks = {
    diff_buf_read = function(bufnr)
      -- Change local options in diff buffers
      vim.opt_local.wrap = false
    end
  }
})

-- Project
lvim.builtin.project.manual_mode = true
lvim.builtin.project.show_hidden = true
lvim.builtin.project.silent_chdir = false

-- Treesitter
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
lvim.builtin.treesitter.indent.enable = false

-- LSP
lvim.lsp.automatic_servers_installation = false
lvim.lsp.document_highlight = false
lvim.lsp.diagnostics.virtual_text = false

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

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
lvim.lsp.on_attach_callback = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gl', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space><space>', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

function OrgImports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

-- require 'lspconfig'.sumneko_lua.setup {}
-- require 'lspconfig'.sumneko_lua.setup {
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT',
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { 'vim', 'lvim' },
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true),
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- }
require 'lspconfig'.dartls.setup {}

require("luasnip/loaders/from_vscode").load({ paths = { "./my-snippets" } }) -- Load snippets from my-snippets folder

-- require("null-ls").setup({
--     sources = {
--         require("null-ls").builtins.formatting.prettier.with({
--             filetypes = { "css" },
--         }),
--         require("null-ls").builtins.diagnostics.eslint,
--         require("null-ls").builtins.completion.spell,
--     },
--     root_dir = function() return vim.loop.cwd() end
-- })

-- LSP Signature
require "lsp_signature".setup({
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

-- Colorlizer
require 'colorizer'.setup(
  { '*'; },
  {
    RGB      = true; -- #RGB hex codes
    RRGGBB   = true; -- #RRGGBB hex codes
    names    = false; -- "Name" codes like Blue
    RRGGBBAA = false; -- #RRGGBBAA hex codes
    rgb_fn   = true; -- CSS rgb() and rgba() functions
    hsl_fn   = false; -- CSS hsl() and hsla() functions
    css      = false; -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn   = false; -- Enable all CSS *functions*: rgb_fn, hsl_fn
  })

-- Fuzzy Finder
vim.cmd([[
  let $FZF_DEFAULT_COMMAND="rg --files --hidden"

  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.85 } }
  let g:fzf_preview_window = ['right:56%', 'ctrl-/']
  let g:fzf_action = {
    \ 'enter': 'edit',
    \ 'ctrl-e': 'tab drop',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit' }
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'TelescopeMatching'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

    "command! -bang -nargs=* Rg
    "  \ call fzf#vim#grep(
    "  \   "rg --column --line-number --no-heading --hidden --smart-case .+",
    "  \   1,
    "  \   fzf#vim#with_preview(),
    "  \   0,
    "  \ )

    function! RgDir(isFullScreen, args)
        let l:path = a:args
        if empty(l:path)
            let l:path = "."
        endif
        call fzf#vim#grep("rg --column --line-number --no-heading -uu --smart-case .+", 1, {'dir': l:path}, a:isFullScreen)
    endfunction

    command! -bang -nargs=? -complete=dir Rg call RgDir(<bang>0, <q-args>)
]])

-- Terminal
lvim.builtin.terminal.open_mapping = [[<c-\>]]

-- Dart
vim.cmd([[
  " Dart autoformat
  let g:dart_format_on_save = 1
]])

---------------------------------------------------------------------
-- Autocommands
---------------------------------------------------------------------
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- Cursor highlight
vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  command = "set cursorline"
})
vim.api.nvim_create_autocmd("WinLeave", {
  pattern = "*",
  command = "set nocursorline"
})

-- Yank Highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  command = "silent! lua vim.highlight.on_yank {higroup=\"CursorLine\", timeout=150}"
})

-- Import
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  command = "lua OrgImports(1000)"
})

-- Colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd([[
          highlight LineNr ctermbg=none guifg=#777777 guibg=none
          highlight CursorLineNr ctermbg=none guifg=#777777 guibg=none
          highlight CursorLine ctermbg=none guifg=none guibg=#3b4451
          highlight Comment ctermbg=none guifg=#777777 guibg=none
          highlight TSComment ctermbg=none guifg=#777777 guibg=none
          highlight Visual ctermbg=none guifg=none guibg=#5c6168
          highlight IncSearch ctermbg=none guifg=#ffffff guibg=#ff2255
          highlight Search ctermbg=none guifg=#ebcb8b guibg=#3b4252 cterm=reverse
          highlight MatchParen ctermbg=none guifg=#ff6a6a guibg=#777777
        ]])
  end
})

-- Indent
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = {
    "*.lua",
    "*.json",
    "*.html",
    "*.js",
    "*.css",
    "*.dart",
  },
  command = "setlocal ts=2 sw=2",
})

---------------------------------------------------------------------
-- Mynord
---------------------------------------------------------------------
vim.g.nord_borders = true
vim.g.nord_italic = false
