" Show title in windows bar
set title

" Disable line number
set nonumber

" Show ruler
set ruler

" Enable highlight of corresponding brackets
set showmatch

" Disable backup file
set nobackup

" Disable highlight of search results
set nohlsearch

" Disable auto indent
set noautoindent

" Enable syntax highlight
syntax on

" Set UTF8 to default encoding
set encoding=utf-8

" Set try encoding order
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

" Set 2 to status line position from end
set laststatus=2 

" Set status information
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

augroup fileTypeIndent

autocmd!

" *.c file -> tab size 8
autocmd BufNewFile,BufRead *.c   setlocal tabstop=8 shiftwidth=8

" *.cpp file -> tab size 8
autocmd BufNewFile,BufRead *.cpp setlocal tabstop=8 shiftwidth=8

" *.h file -> tab size 8
autocmd BufNewFile,BufRead *.h   setlocal tabstop=8 shiftwidth=8

" *.py file -> tab size 4 and space expand
autocmd BufNewFile,BufRead *.py  setlocal tabstop=4 shiftwidth=4 expandtab

" *.sh file -> tab size 2 and space expand
autocmd BufNewFile,BufRead *.sh  setlocal tabstop=4 shiftwidth=4 expandtab

augroup END

"改行文字とタブ文字を表示
"set list
"set listchars=tab:\ \ ,eol:\ 

"改行文字とタブ文字の色設定（NonTextが改行、SpecialKeyがタブ）
"hi NonText guibg=lightgreen guifg=NONE ctermbg=lightgreen ctermfg=NONE
"hi SpecialKey guibg=lightred guifg=Gray ctermbg=lightred ctermfg=Gray

" GLOBAL用ショートカット設定
"map <C-d> <C-w>j:q<CR>
"map <C-g> :Gtags 
"map <C-l> :Gtags -f %<CR>
"map <C-j> :GtagsCursor<CR>
"map <C-n> :cn<CR>
"map <C-p> :cp<CR>

" 日付挿入コマンド
"inoremap <Leader>date <C-R>=strftime('%Y-%m-%d')<CR>

" テンプレートファイルの読み込み
"autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" NeoBule自身の管理
NeoBundleFetch 'Shougo/neobundle.vim'

" ツリーでファイル表示
NeoBundle 'scrooloose/nerdtree'

" pythonの補完機能
NeoBundle 'davidhalter/jedi-vim'

" 構文エラーチェック機能(多言語対応)
NeoBundle 'scrooloose/syntastic'

" python用構文エラーチェック機能
NeoBundle 'kevinw/pyflakes-vim'

" 現在の関数を表示
NeoBundle 'tyru/current-func-info.vim'

call neobundle#end()
 
" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

" Short Cut for nerdtree
nnoremap <silent> <C-q> :NERDTreeToggle<CR>

" Short Cut for current-func-info.vim
nnoremap <C-g>f :echo cfi#format("%s", "")<CR>

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]

" t<num>: jump to Tab <number>
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc: create new tab in rightmost
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx: close tab
map <silent> [Tag]x :tabclose<CR>
" tn: next tab
map <silent> [Tag]n :tabnext<CR>
" tp: previous tab
map <silent> [Tag]p :tabprevious<CR>

