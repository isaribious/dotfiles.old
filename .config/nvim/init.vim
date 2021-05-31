"----------------------------------------------------
" Dein
"----------------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Required:
" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  "call dein#add('neovim/python-client')
  "call dein#add('Shougo/dein.vim')
  "call dein#add('critiqjo/lldb.nvim')

  " プラグインリストを収めた TOML ファイル置き場
  let s:rc_dir = expand('~/.config/nvim/')

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:rc_dir . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:rc_dir . '/lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" plugin installation check
if dein#check_install()
  call dein#install()
endif

" plugin remove check
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

"----------------------------------------------------
" 基本設定
"----------------------------------------------------
" 文字コード
set encoding=utf-8
" 書込文字コード
set fileencoding=utf-8
" 読込文字コード
set fileencodings=utf-8,euc-jp,shift_jis
" 改行コードの自動認識
set fileformats=unix,dos,mac

" 検索
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set history=100

" 表示
set title
syntax enable
set background=dark
"colorscheme hybrid
colorscheme mycolor
set signcolumn=yes
"set cursorline

" コマンドライン
set laststatus=2
set cmdheight=2
set showcmd
set statusline=%f%m%=%l,%c\ %{'['.(&fenc!=''?&fenc:&enc).']\ ['.&fileformat.']'}
set wildmenu
set wildmode=list:longest

" インデント/タブ/ラップ
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
augroup vimrc
  autocmd! FileType html       setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType gohtmltmpl setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType smarty     setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType css        setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END
set backspace=2

" マウス有効
set mouse=a

" Copy&Past
set clipboard+=unnamedplus
"" For Neovim Bug (* Rectangle Past is not working.)
"map p <Plug>(miniyank-autoput)
"map P <Plug>(miniyank-autoPut)

" -(Misc)-

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
" 改行で自動的にコメント挿入されるのを防ぐ
autocmd FileType * setlocal formatoptions-=ro
" □とか○の文字があってもカーソル位置がずれないようにする
"if exists('&ambiwidth')
"  set ambiwidth=double
"endif
" ビープ音を鳴らさない
set vb t_vb=
" オムニ補完
set completeopt=menuone

" タブ文字の先頭にカーソルを表示
set list lcs=tab:\ \ 
" Notes) Therea is the extra space after the second '\'.

"----------------------------------------------------
" Leader
"----------------------------------------------------
let mapleader = "\<Space>"

"----------------------------------------------------
" Vimタブ表示
"----------------------------------------------------
" The prefix key.
nnoremap    [Tag]   <Nop>
" Tab jump
nmap    t [Tag]
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tt 新しいタブを一番右に作る
nnoremap <silent> [Tag]t :<C-u> $tabnew<CR>
" tq タブを閉じる
nnoremap <silent> [Tag]q :<C-u> tabclose<CR>
" tl 次のタブ
nnoremap <silent> [Tag]l :<C-u> tabnext<CR>
" th 前のタブ
nnoremap <silent> [Tag]h :<C-u> tabprevious<CR>

"----------------------------------------------------
" LSP Client (Trial 1)
"----------------------------------------------------
" Required for operations modifying multiple buffers like rename.
set hidden

" 各言語の Language Server の起動コマンド
"let g:LanguageClient_serverCommands = {
"        \ 'go': ['gopls']
"        \ }
let g:LanguageClient_serverCommands = {
    \ 'go': {
    \   'name': 'gopls',
    \   'command': ['gopls'],
    \   'initializationOptions': {
    \     'usePlaceholders': v:true,
    \     'codelens': {
    \       'generate': v:true,
    \       'test': v:true,
    \     },
    \   },
    \ },
    \}
let g:LanguageClient_loggingLevel = 'WARN'
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
let g:LanguageClient_fzfContextMenu = 1
"let g:LanguageClient_fzfOptions = v:null
let g:LanguageClient_hoverPreview = 'No'
let g:LanguageClient_useVirtualText = 'All'
let g:LanguageClient_virtualTextPrefix = '>> '
let g:LanguageClient_windowLogMessageLevel = 'Warning'
let g:LanguageClient_diagnosticsEnable = 1
"let g:LanguageClient_diagnosticsEnable = 0
"let g:LanguageClient_diagnosticsList = 'Quickfix'
let g:LanguageClient_diagnosticsList = 'Disabled'

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap gm <Plug>(lcn-menu)
" Or map each action separately
nmap <silent> <leader>h <Plug>(lcn-hover)
nmap <silent> <leader>r <Plug>(lcn-rename)
nmap <silent> <leader>d <Plug>(lcn-definition)
nmap <silent> <leader>l <Plug>(lcn-references)
nmap <silent> <leader>i <Plug>(lcn-implementation)
nmap <silent> <leader>m <Plug>(lcn-code-action)
nmap <silent> <leader>s <Plug>(lcn-symbols)
nmap <silent> <C-n> <Plug>(lcn-diagnostics-next)
nmap <silent> <C-p> <Plug>(lcn-diagnostics-prev)

" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

"----------------------------------------------------
" vim-go 
"----------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"let g:go_list_type = "quickfix"
"let g:go_fmt_fail_silently = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode='gopls'
let g:go_decls_includes = "func,type"
let g:go_doc_keywordprg_enabled = 0

au FileType go nmap <leader>. <Plug>(go-run)
au FileType go nmap <leader>, <Plug>(go-run-tab)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
"au FileType go nmap <Leader>e <Plug>(go-info)

"au FileType go nmap <Leader>gd <Plug>(go-doc)
"au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
"au FileType go nmap <Leader>d <Plug>(go-def)
"au FileType go nmap <Leader>n <Plug>(go-def-tab)
"au FileType go nmap <Leader>v <Plug>(go-def-vertical)
"au FileType go nmap <Leader>s <Plug>(go-def-split)
"au FileType go nmap <Leader>l <Plug>(go-referrers)
"au FileType go noremap <Leader>l :GoDeclsDir<cr>

au FileType go :highlight goErr cterm=bold ctermfg=181 "214 210
au FileType go :match goErr /\<err\>/

"----------------------------------------------------
" Fuzzy Finder
"----------------------------------------------------
let $FZF_DEFAULT_OPTS="--layout=reverse --inline-info --preview 'head -100 {}'"
"let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_history_dir = '~/.local/share/fzf-history'

function! s:find_rip_grep() abort
    call fzf#vim#grep(
                \   'rg --ignore-file ~/.ignore --column --line-number --no-heading --hidden --smart-case .+',
                \   1,
                \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', 'ctrl-/'),
                \   0,
                \ )
endfunction

nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>g :<C-u>silent call <SID>find_rip_grep()<CR>

"----------------------------------------------------
" Key Map Assignment
"----------------------------------------------------
noremap <S-h>   ^
noremap <S-l>   $
"noremap <S-j>   }
"noremap <S-k>   {
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>
"nnoremap <Leader>j :GtagsCursor<CR>
"nnoremap <Leader>l :Gtags -f %<CR>
nnoremap <Leader>a :copen<CR>
nnoremap <Leader>q :cclose<CR>

nnoremap <silent><Esc><Esc> :<C-u>noh<CR>

"----------------------------------------------------
" Vim Session
"----------------------------------------------------
"au VimLeave * mks! ~/.vim.session
noremap <Space>= :<C-u>mks! ~/.vim.session<CR>
noremap <Space>` :<C-u>source ~/.vim.session<CR>
