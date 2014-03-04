" ウィンドウサイズの設定
" " 縦幅
set lines=52
" " 横幅
set columns=92

" " タブを常に表示
set showtabline=2

" " 透明度
set transparency=5

" " カラースキーマ
colorscheme desert

" " フォント設定
set guifont=Ricty:h16
" set guifontwide=Osaka:h16
" set guifont=Osaka-Mono:h16

" " 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" " 行番号を表示
set number

" " カーソル行をハイライト
set cursorline

" "コマンド補完
set wildmenu
set wildmode=list:longest
set completeopt=menu,preview,menuone

" "ツールバー
"set guioptions+=T
