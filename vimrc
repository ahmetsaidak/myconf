set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'rhysd/vim-clang-format'
call vundle#end()            

filetype plugin indent on    

set encoding=utf-8

colo desert
syntax on
set number
set expandtab
set updatetime=100

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let mapleader = ","
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>r :so $MYVIMRC<cr>
nnoremap <leader>f :NERDTreeToggle<cr>
nnoremap <leader>n :tabn<cr>
nnoremap <leader>p :tabp<cr>
nnoremap <Leader>u <Plug>GitGutterUndoHunk
nnoremap <leader>C :ClangFormat<cr>
nnoremap <leader>cn :call Copy2new()<cr>

function! Copy2new()
   let alltext = getline(1,'$')  
   tabnew
   call setline('.', alltext)
endfunction

set clipboard=unnamed
