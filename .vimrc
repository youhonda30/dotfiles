"--------------------------------------------------------------------------
" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

"GitHubリポジトリにあるプラグインを利用場合
"NeoBundle 'tpope/vim-fugitive'
"
""GitHub以外のGitリポジトリにあるプラグインを利用する場合
NeoBundle 'git://git.wincent.com/command-t.git'

"Git以外のリポジトリにあるプラグインをを利用する場合
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
" NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'

