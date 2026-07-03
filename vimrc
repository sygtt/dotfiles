" =============================================================================
" .vimrc - general purpose Vim settings
" =============================================================================

" vi互換ではなくVim標準の挙動にする
set nocompatible

" このvimrcをUTF-8として読む
scriptencoding utf-8

" Vim内部の文字コードをUTF-8にする
set encoding=utf-8

" ファイルを開く時に試す文字コードの順番
set fileencodings=utf-8,ucs-bom,iso-2022-jp,euc-jp,sjis,cp932,latin1

" ファイルを開く時に試す改行コードの順番
set fileformats=unix,dos,mac

" 外部で変更されたファイルを自動再読み込みしやすくする
set autoread

" 未保存バッファを裏に隠したまま別バッファへ移動できるようにする
set hidden

" コマンド履歴と検索履歴の保存数を増やす
set history=10000

" ターミナルのタイトルに編集中ファイル名を表示する
set title

" 外部変更を検知するタイミングを増やす
augroup vimrc_checktime
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~# '\v(c|r.?|!|t)' | silent! checktime | endif
augroup END

" swap/backup/undoファイルの保存先
let s:cache_dir = expand('~/.vim/cache')

" 必要な保存先ディレクトリを作成する
for s:dir in [s:cache_dir, s:cache_dir . '/swap', s:cache_dir . '/backup', s:cache_dir . '/undo']
  if !isdirectory(s:dir)
    silent! call mkdir(s:dir, 'p')
  endif
endfor

" swapfileをプロジェクト直下ではなくcache配下へ置く
execute 'set directory=' . fnameescape(s:cache_dir . '/swap') . '//,.'

" 保存後のbackupは残さず、保存中の一時backupだけ使う
set nobackup
set writebackup

" backupの保存先をcache配下へ置く
execute 'set backupdir=' . fnameescape(s:cache_dir . '/backup') . '//,.'

" Vimを閉じてもUndo履歴を残す
if has('persistent_undo')
  set undofile
  execute 'set undodir=' . fnameescape(s:cache_dir . '/undo') . '//,.'
endif

" Undo履歴数を増やす
set undolevels=10000

" 構文ハイライトを有効にする
syntax enable

" ファイルタイプ検出・プラグイン・インデントを有効にする
filetype plugin indent on

" 行番号を表示する
set number

" 画面右下にカーソル位置を表示する
set ruler

" 入力途中のコマンドを表示する
set showcmd

" ステータスラインを常に表示する
set laststatus=2

" コマンドラインの高さを1行にする
set cmdheight=1

" 画面最下行でも可能な限り内容を表示する
set display=lastline

" 対応する括弧を一瞬表示する
set showmatch

" 対応括弧の表示時間を短くする
set matchtime=1

" 現在行をハイライトする
set cursorline

" エラーやGit差分などの表示列を常に確保する
set signcolumn=yes

" 不可視文字の表示形式を指定する
set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:%

" 不可視文字表示を切り替える
nnoremap <silent> <Leader>l :set list!<CR>

" 折り返し表示された行を見た目通りに上下移動する
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" 小文字検索時は大文字小文字を無視する
set ignorecase

" 検索語に大文字が含まれる時だけ大文字小文字を区別する
set smartcase

" 検索文字の入力中に一致箇所へ移動する
set incsearch

" 検索結果をハイライトする
set hlsearch

" ファイル末尾まで検索したら先頭へ回り込む
set wrapscan

" Escを2回押したら検索ハイライトを消す
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" 検索ジャンプ後にカーソル位置を画面中央へ寄せる
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> * *zzzv
nnoremap <silent> # #zzzv

" 前の行のインデントを引き継ぐ
set autoindent

" C系の構文で簡易的にインデントする
set smartindent

" Tab入力時にshiftwidthを意識する
set smarttab

" Tab入力をスペースに変換する
set expandtab

" Tab文字を画面上で4文字幅にする
set tabstop=4

" 自動インデント幅を4にする
set shiftwidth=4

" 挿入モードでのTab/Backspace幅を4にする
set softtabstop=4

" ファイルタイプごとにインデント設定を変える
augroup vimrc_filetype_indent
  autocmd!
  autocmd FileType html,css,scss,javascript,typescript,json,yaml,toml,vue,svelte setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
  autocmd FileType make setlocal noexpandtab
augroup END

" コマンドライン補完メニューを表示する
set wildmenu

" コマンドライン補完の動作を指定する
set wildmode=list:longest,full

" コマンドライン補完で大文字小文字を無視する
set wildignorecase

" 補完候補から生成物や大きいディレクトリを除外する
set wildignore+=*.o,*.obj,*.pyc,*.class
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.webp,*.pdf
set wildignore+=*/.git/*,*/node_modules/*,*/target/*,*/dist/*,*/build/*

" Backspaceでインデント・改行・挿入開始位置より前も消せるようにする
set backspace=indent,eol,start

" カーソル上下に最低5行の余白を保つ
set scrolloff=5

" カーソル左右に最低8文字の余白を保つ
set sidescrolloff=8

" 横分割を下に開く
set splitbelow

" 縦分割を右に開く
set splitright

" マクロ実行中などの再描画を減らす
set lazyredraw

" 高速なターミナル向けの描画にする
set ttyfast

" キーマッピング入力待ちを有効にする
set timeout

" キーマッピングの続きを待つ時間を500msにする
set timeoutlen=500

" キーコード判定の待ち時間を10msにする
set ttimeoutlen=10

" Ctrl-a/Ctrl-xで数字を10進数として扱いやすくする
set nrformats=

" 行頭・行末をまたいで左右移動できるようにする
set whichwrap=b,s,h,l,<,>,[,],~

" ターミナル貼り付け時の自動インデント事故を減らす
if &term =~# 'xterm\|screen\|tmux\|rxvt'
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  exec "set t_PS=\e[200~"
  exec "set t_PE=\e[201~"
endif

" 前回ファイルを閉じたカーソル位置へ戻る
augroup vimrc_restore_cursor
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   execute 'normal! g`"' |
        \ endif
augroup END

" このvimrcを保存したら自動で再読み込みする
augroup vimrc_auto_source
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

" -----------------------------------------------------------------------------
" Custom keymaps
" -----------------------------------------------------------------------------

" LeaderキーをSpaceにする
let mapleader = "\<Space>"

" Insert/Replace/Visual modeからCtrl-kでNormal modeに戻る
inoremap <C-k> <Esc>
rnoremap <C-k> <Esc>
vnoremap <C-k> <Esc>

" InsertとAppendを入れ替える
nnoremap i a
nnoremap a i
nnoremap I A
nnoremap A I

" 標準のK/JをLeader付きに退避する
nnoremap <Leader>K K
nnoremap <Leader>J J

" K/Jで10行移動する
nnoremap K 10k
nnoremap J 10j

" Hで行頭の非空白文字へ移動、Lで行末へ移動する
nnoremap H ^
nnoremap L $
