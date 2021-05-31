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
colorscheme mycolor
"colorscheme hybrid

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
  autocmd! FileType smarty     setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType css        setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END
set backspace=2

" マウス有効
set mouse=a
set ttymouse=xterm2

" Copy/Paste/Cut
set clipboard=unnamed,autoselect


" -(Misc)-

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
" 改行で自動的にコメント挿入されるのを防ぐ
autocmd FileType * setlocal formatoptions-=ro
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
" ビープ音を鳴らさない
set vb t_vb=
" オムニ補完
set completeopt=menuone
