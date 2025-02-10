" Specify location of viminfo
set viminfo+=n${XDG_CACHE_HOME}/vim/.viminfo

" Set colorscheme (https://github.com/tomasiser/vim-code-dark.git)
colorscheme codedark

" Enable spell detection
" setlocal spell
" set spelllang=en
" inoremap <C-L> <c-g>u<Esc>[s1z=`]a<c-g>u

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Enable syntax highlighting
syntax enable

" Automatically indent newlines to match the previous line
set autoindent

" Replace tabs with two spaces
set smarttab
set tabstop=4 shiftwidth=4 expandtab

" Enables status bar with {filename    Line Column}
set laststatus=2
set statusline=%F%=L:%l\ C:%c%V
highlight StatusLine ctermbg=none cterm=bold ctermfg=darkgray

" Set window title to filename
set title
set titlestring=%t

" Disable text wrapping at column 80
set nowrap

" Enforce unix line endings
set fileformat=unix

" Highlight while searching
set incsearch

" Ignore case while searching
set ignorecase

" Clear any listchars on startup
set listchars=
set list

" Enable and Color LineNr
set number
highlight LineNr ctermbg=none ctermfg=darkgray

" Combine signcolumn with numbers
set signcolumn=number

" Enable and Highlight active line
set cursorline
set cursorlineopt=number
highlight CursorLineNr ctermbg=black ctermfg=white cterm=bold

" Binds the 1 and 2 keys to toggle listchars
:map 1 :set listchars=space:·,trail:¿,tab:\ \  number scl=number<CR>
:map 2 :set listchars= nonumber scl=no<CR>
:map 3 :nohlsearch<CR>

" Set all files in the directory as Ansible files for syntax highlighting
autocmd BufRead,BufNewFile ${HOME}/git/workstation/ansible/hosts/* set filetype=ansible_hosts
autocmd BufRead,BufNewFile ${HOME}/git/workstation/ansible/playbooks/*.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile ${HOME}/git/workstation/ansible/roles/*.j2 set filetype=ruby.jinja2
autocmd BufRead,BufNewFile ${HOME}/git/workstation/ansible/roles/*.yaml set filetype=yaml.ansible

" Set 'updatetime' to 15 seconds when in insert mode
autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=15000
autocmd InsertLeave * let &updatetime=updaterestore

" Automatically leave insert mode after 'updatetime' milliseconds of inaction
" or losing focus
autocmd CursorHoldI * stopinsert

autocmd BufLeave,FocusLost * stopinsert

" Set the shell to always be a login shell
set shell=bash\ -l

" ALE options
let g:ale_echo_msg_format = '[%severity%] %s [%linter%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_virtualtext_cursor = 'disabled'
" See more here: https://github.com/dense-analysis/ale/tree/master/doc
" ignore line too long warning
let g:ale_sh_bashate_options = '--ignore E006'
" ignore specific apt package version
let g:ale_dockerfile_hadolint_options = '--ignore DL3008'
" ignore specific dnf package version
let g:ale_dockerfile_hadolint_options = '--ignore DL3041'

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

