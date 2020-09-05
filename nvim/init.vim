set autochdir
set autoindent
set clipboard+=unnamedplus
set cursorline
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set nobackup
set noswapfile
set number
set shiftwidth=4
set showcmd
set showmatch matchtime=1
set smartcase
set smartindent
set smarttab
set tabstop=4
set title
set virtualedit=onemore
set visualbell
set whichwrap=b,s,h,l,<,>,~,[,]
set wildmenu
set wrap
set wrapscan

autocmd BufWritePre * :%s/\s\+$//ge

nnoremap <C-j> }
nnoremap <C-k> {
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

inoremap jj <Esc>

let mapleader = "\<Space>"

nnoremap <leader>q :q!<cr>
nnoremap <leader>r :source ~/.config/nvim/init.vim<cr>
nnoremap <Leader>w :wa<CR>

let s:nvim_root = expand('~/.config/nvim')
let s:plug_root = s:nvim_root . '/plugins'
let s:dein_root = s:plug_root . '/repos/github.com/Shougo/dein.vim'

" insatll Dein.vim
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_root)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_root
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_root, ':p')
endif

" load plugins
if dein#load_state(s:plug_root)
  call dein#begin(s:plug_root)

  let g:rc_root   = s:nvim_root . '/rc'
  let s:dein_toml = g:rc_root . '/dein.toml'
  let s:lazy_toml = g:rc_root . '/lazy.toml'

  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" install plugins
if dein#check_install()
  call dein#install()
endif

" remove uninstalled plugins
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

syntax enable

" Defx.vim
autocmd FileType defx call s:defx_settings()

function! s:defx_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> t
  \ defx#do_action('open','tabnew')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('drop', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

call defx#custom#option('_', {
  \ 'buffer_name': 'exproler',
  \ 'columns': 'indent:git:icons:filename:mark',
  \ 'direction': 'topleft',
  \ 'resume': 1,
  \ 'show_ignored_files': 1,
  \ 'split': 'vertical',
  \ 'toggle': 1,
  \ 'winwidth': 40,
  \ })

call defx#custom#column('git', 'indicators', {
  \ 'Deleted'   : '✖',
  \ 'Ignored'   : '☒',
  \ 'Modified'  : '✹',
  \ 'Renamed'   : '➜',
  \ 'Staged'    : '✚',
  \ 'Unknown'   : '?',
  \ 'Unmerged'  : '═',
  \ 'Untracked' : '✭',
  \ })

" highlight
autocmd FileType go :highlight goErr ctermfg=120 " light green
autocmd FileType go :match goErr /\<err\>/
