if !exists('g:myvimrc')
    let g:myvimrc = 1
endif

if g:myvimrc
    augroup every
  autocmd!
  au InsertEnter * set norelativenumber | set cursorcolumn
  au InsertLeave * set relativenumber | set nocursorcolumn
augroup END " no number when insert
    set shortmess+=c
    set lazyredraw
    set smartcase
    set ignorecase
    set formatoptions-=cro
    set tw=0
    set hidden
    set nobackup
    set nowritebackup
    set signcolumn=yes
    set backspace=indent,eol,start
    set nocompatible
    set number 
    set relativenumber
    set nowrap 
    set shiftwidth=4
    set smarttab
    set title
    set statusline+=%=%l:%c
    set statusline=[%n]\ [%t]
    set expandtab
    set laststatus=2
    set cursorline

    "standart mapping
    inoremap jj <ESC>
    nnoremap Q @@
    map <S-o> o<ESC>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    "leader
    let mapleader = " "
    map <leader> :
    map <leader>q :q!<CR>
    map <leader>w :w<CR>
    map <leader>k :bnext<CR>
    map <leader>j :bprev<CR>
    "localleader
    let maplocalleader = ","
    map <localleader>w ysiw
    map <localleader>a :set wrap
    "Markdown to HTML
    nmap <localleader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>
    map <localleader>v :VimuxPromptCommand<CR>
    map <C-i> :NERDTreeToggle<CR>
    """""""""""""""""""""""""""""""""""""
    
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
command! Snip :CocCommand snippets.editSnippets<CR>
"indent guides
let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=black
" emmet
let g:user_emmet_expandword_key = '<C-y>1'
let g:user_emmet_update_tag = '<C-y>2'
let g:user_emmet_balancetaginward_key = '<C-y>3'
let g:user_emmet_balancetagoutward_key = '<C-y>4'
let g:user_emmet_next_key = '<C-y>5'
let g:user_emmet_prev_key = '<C-y>6'
let g:user_emmet_imagesize_key = '<C-y>7'
let g:user_emmet_togglecomment_key = '<C-y>8'
let g:user_emmet_splitjointag_key = '<C-y>9'
let g:user_emmet_anchorizeurl_key = '<C-y>10'
let g:user_emmet_anchorizesummary_key = '<C-y>11'
let g:user_emmet_mergelines_key = '<C-y>12'
let g:user_emmet_codepretty_key = '<C-y>13'

let g:user_emmet_leader_key=','
"===== fzf====
" ====== guttentags =====
set statusline+=%{gutentags#statusline()}
 let g:gutentags_project_root = ['.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
"Use the following command to clear the cache quickly:
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
let g:gutentags_ctags_exclude = ['*.css', '*.html','*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*','*.']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
""""""""""""end guttentags"""""""""""""""""""""""""
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1


" ===== gitgutter ==== 
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_sign_removed = 'x'
set updatetime=100 " update sign colum every quarter second = default is 4000
""""""""end gitgutter"""""""""""""""""""""""""""""



" --- coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

imap <C-j> <Plug>(coc-snippets-expand)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<C-n>'
let g:coc_snippet_prev = '<C-p>'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" nerdtree
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeMinimalUI = 1
let NERDTreeeDirArrows = 1
" syntastic "
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
function! ToggleSyntastic()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            lclose
            return
        endif
    endfor
    SyntasticCheck
endfunction
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
endif
