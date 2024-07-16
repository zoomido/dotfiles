" Vim config for the greatest success

set encoding=UTF-8

" Set buffers to hide when changing between them (will silence save error)
set hidden

" Shorter break after leaving insert mode
set ttimeoutlen=50
set timeoutlen=1000

" Don't update screen while doing macros and registers ...
set lazyredraw
" Avoid slow rendering for long lines
set synmaxcol=250
" Faster syntax highlighting
" syntax sync minlines=200
syntax sync fromstart

" Send more characters to screen for redrawing
set ttyfast

" Don't create swap files
" set noswapfile
" Save swapfiles in unified directory
set directory^=~/.vim/tmp//

" Create undofile for undo after close
if has("persistent_undo")
    set undodir=~/.vim_undodir "create this folder manually
    set undofile
endif

" Source all files in a dir
function! SourceDirectory(path)
  for s:fpath in split(globpath(a:path, '*.vim'), '\n')
    exe 'source' s:fpath
  endfor
endfunction






" ---------
" Vim-plug
" ---------

call plug#begin('~/.vim/plugged')

" -- Generic Tools
" Fzf <3 Vim (also install fzf)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Vim Clap - interactive finder
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" List changes from undofile
Plug 'mbbill/undotree'
" Local history / Autobackup
Plug 'mg979/vim-localhistory'
" Copy & paste with system clipboard
Plug 'christoomey/vim-system-copy'
" Copy and paste with OSC 52 escape sequence
Plug 'haya14busa/vim-poweryank'
" Vim surround command 's'
Plug 'tpope/vim-surround'
" Move around easier
Plug 'easymotion/vim-easymotion'
" Better incsearch and integration with easymotion
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
" Peek in the registers " and @
Plug 'junegunn/vim-peekaboo'
" Keep yank history
" Plug 'svermeulen/vim-yoink'
" Search for visual selection in file
" Plug 'TheDerkus/vstar.vim'
Plug 'bronson/vim-visual-star-search'
" Start screen for vim
Plug 'mhinz/vim-startify'
" Set the working dir to closest VCS root
Plug 'airblade/vim-rooter'
" Jira Plugin
" Plug 'Shougo/unite.vim' "dependency for vim-unite
" Plug 'mattn/webapi-vim' "dependency for vim-unite
" Plug 'rafi/vim-unite-issue'
" Narrow Region Plugin. Open section in a new view
" Plug 'chrisbra/NrrwRgn' " settings deactivated

" Tree explorers
" Vim Vinegar for netrw improvements
" Plug 'tpope/vim-vinegar'
" Easy tree explorer
Plug 'cocopon/vaffle.vim'
" Dark powered file explorer + 2 dependencies (need pynvim/neovim)
" Plug 'Shougo/defx.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Simple folder browsing
" Plug 'justinmk/vim-dirvish'
" Nerdtree File browsing/tree
" Plug 'scrooloose/nerdtree'
" Nerdtree plugin to open from visual selection
" Plug 'PhilRunninger/nerdtree-visual-selection'
" Nerdtree file highlighting
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Mercurial support in Nerdtree
" Plug 'f4t-t0ny/nerdtree-hg-plugin'
" LustyExplorer for clearer dir listing
" Plug 'sjbach/lusty'


" -- Coding tools
" Vim commentary for commenting
Plug 'tpope/vim-commentary'
" Shows VCS changes in file
Plug 'mhinz/vim-signify'
" Git wrapper for vim
Plug 'tpope/vim-fugitive'
" Better % (matching html tags)
Plug 'andymass/vim-matchup'
" Auto closing pairs but nicer
Plug 'Raimondi/delimitMate'
" Edit HTML tags together automatically
Plug 'AndrewRadev/tagalong.vim'
" Auto closing chars
" Plug 'jiangmiao/auto-pairs'
" SQL for Vim
Plug 'tpope/vim-dadbod'
" Emmet expansion for vim
" Plug 'mattn/emmet-vim'
" Tag generator for vim
" Plug 'ludovicchabant/vim-gutentags'
" Tagbar sidebar
" Plug 'majutsushi/tagbar'

" TabNine autocompletion
" Plug 'zxqfl/tabnine-vim'

" Coc for autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'marlonfan/coc-phpls', {'do': 'yarn install'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'} " Highlight yanks & provide persist yank list cross vim instance
" Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " Highlight symbol of current position
" Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'} " Auto create pairs ({' etc
" Plug 'voldikss/coc-todolist', {'do': 'yarn install --frozen-lockfile'} " Create todos

" -- Visual improvements
" Better syntax highlighting
Plug 'sheerun/vim-polyglot'
" Airline statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Smooth scrolling with Ctrl+D,U,F,B
Plug 'psliwka/vim-smoothie'
" Highlight search
Plug 'inside/vim-search-pulse'
" Highlight yanks
" Plug 'machakann/vim-highlightedyank'
" Highlight same words
Plug 'RRethy/vim-illuminate'
" Devicons
Plug 'ryanoasis/vim-devicons'

" -- Theme
Plug 'arzg/vim-colors-xcode'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
" Plug 'phanviet/vim-monokai-pro'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'ayu-theme/ayu-vim'
" Plug 'ajh17/Spacegray.vim'
" Plug 'dracula/vim', { 'name': 'dracula' }
" Plug 'axvr/photon.vim'
" Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()




" ------------------------------------------
" Project specifics or other local settings
" ------------------------------------------

" Source all files in this dir
call SourceDirectory('~/.dotfiles-private')




" -----------
" Appearance
" -----------

" Turn off annoying beep sound
" -----------------------------
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Theme & settings
" -----------------

" Use 24-bit color
set termguicolors
" Set background to dark
set background=dark

colorscheme xcodedark
" colorscheme one
" colorscheme gruvbox
" colorscheme spacegray
" colorscheme palenight
" colorscheme ayu
" colorscheme monokai_pro
" colorscheme dracula
" colorscheme photon

" -- One settings
" autocmd VimEnter * call one#highlight('ColorColumn', 'fafafa', 'c678dd', 'none')
" let g:airline_theme='one'
" let g:airline_theme='transparent'
" let g:airline_theme='dark'

" -- Gruvbox settings
let g:gruvbox_contrast_dark='medium'
" let g:gruvbox_color_column='green'
" let g:gruvbox_sign_column='red'
" let g:gruvbox_number_column='yellow'

" -- Ayu settings
" let ayucolor="mirage"
" let ayucolor="dark"
" let ayucolor="light"

" -- Palenight settings
"let g:airline_theme = 'palenight'
" Italics for my favorite color scheme
" let g:palenight_terminal_italics=1

" -- Load base16 colors
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

" Change theme on enter and leave insert mode (slows vim?)
" au InsertLeave * colorscheme gruvbox
" au InsertEnter * colorscheme apprentice

" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" Don't give |ins-completion-menu| messages.
set shortmess+=c
" Always show signcolumns
set signcolumn=yes

" Turn on scroll margin
set scrolloff=5

" Turn on syntax highlighting
syntax on

" Highlight the current line
set cursorline
highlight CursorLine guibg=#444444
autocmd InsertEnter * highlight CursorLine guibg=#444466
autocmd InsertLeave * highlight CursorLine guibg=#444444

" Change default highlighting of word under cursor
hi MatchParenCur cterm=bold,underline gui=bold,underline

" Use case-sensitive only search when Captial Letters are used.
set ignorecase
set smartcase


" Text wrapping
" --------------

" Wrap text at this length. Not needed since using highlighting below.
" set textwidth=120
" Don't wrap long lines.
set nowrap
" Highlight column over 120 chars
" set colorcolumn=121
call matchadd('ColorColumn', '\%121v', 100)
highlight ColorColumn ctermbg=69 guibg=CornflowerBlue


" Line numbers
" -------------

" Turn hybrid line numbers on
set number
" set number relativenumber
" Change line numbers depending on mode
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END


" Search
" -------

" Highlight search and stop highlighting when exiting insert mode
set hlsearch
au InsertLeave * :let @/=""
" Search as soon as typing starts
set incsearch
" Set /g as the default option when doing search and replace
set gdefault


" Show tabs, nbsp and trailing spaces, < or >
" when characters are not displayed on the left or right.
" --------------------------------------------

set list
" listchars: tab:»·, trail:·, nbsp:~, precedes:<, extends:>, eol:¶
set listchars=tab:»·,trail:·,nbsp:~,precedes:<,extends:>


" Tabs and indentation
" ---------------------

" https://vim.fandom.com/wiki/Indenting_source_code
" Use filetype based indenting
filetype plugin indent on
" Changes the width of the TAB character. When unset use default 8 chars.
set tabstop=4
" When indenting with '>>', '<<' or '==', use 4 spaces width. Also for auto indent.
set shiftwidth=4
" If 'expandtab' is set, pressing the <TAB> key will always insert 'softtabstop' amount of space characters
set expandtab
" Affects what happens when you press the <TAB> or <BS> keys
set softtabstop=4
" Copy the indentation from the previous line, when starting a new line
set autoindent

" Don't add comment on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open splits to right and bottom instead of default
set splitright
set splitbelow




" ----------------
" Plugin settings
" ----------------

" Generic
" --------

" -- Netrw
" Use tree style
" let g:netrw_liststyle = 3
" Change dir when browsing around in netrw
" let g:netrw_keepdir = 0
" Dont reuse buffers (fix orphan buffers?)
" let g:netrw_fastbrowse = 0

" -- Vim Vaffle
let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

" -- Vim Clap settings
" let g:clap_theme = 'material_design_dark'
" Make popup bigger
let g:clap_layout = { 'width': '80%', 'height': '90%', 'row': '10%', 'col': '10%' }
" Faster search
let g:clap_popup_input_delay = 50
" Delay when moving through the search result list
let g:clap_on_move_delay = 50
" Show the working directory in the prompt
function! ClapFormat() abort
    if exists('g:__clap_provider_cwd')
        let cwd = g:__clap_provider_cwd
    else
        let cwd = getcwd()
    endif
    return '%spinner% '.cwd.':'
endfunction
let g:ClapPrompt = function('ClapFormat')

" -- Yoink settings (has:keys)
" let g:yoinkSyncNumberedRegisters = 1
" let g:yoinkMoveCursorToEndOfPaste = 1

" -- Illuminate current word
let g:Illuminate_delay = 1000
" Change color of current symbol highlight
highlight illuminatedWord cterm=underline ctermbg=60 gui=underline guibg=MediumPurple4

" -- Local history settings
let g:lh_autobackup_first = 1
" let g:lh_autobackup_size = 51200
let g:lh_autobackup_frequency = 15

" -- Easymotion (has:keys)
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" -- Set Startify settings
" Autosave sessions on exit when leaving vim and loading a new session
let g:startify_session_persistence = 1
" Show files with or without relativ path
" let g:startify_relative_path = 1
" Don't change to files dir when opening
let g:startify_change_to_dir = 0
" Change to VCS dir if there is one (git & hg)
let g:startify_change_to_vcs_root = 1
" Jump to last position when opening a file
let g:startify_restore_position = 1
" Set what to show on startpage
let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
" Add custom bookmarks
let g:startify_bookmarks = [
            \ {'cv': '~/.dotfiles/vimrc'},
            \ {'cz': '~/.dotfiles/zshrc'},
            \ {'ch': '~/.dotfiles/hammerspoon/init.lua'},
            \ {'cs': '~/.dotfiles/surfingkeys.js'},
            \ {'ck': '~/.dotfiles/kitty.conf'}
            \ ]
" How many files to display in the files & dir lists
let g:startify_files_number = 5

" -- NERDTree (has:keys)
" Quit NERDTree when opening a file
" let g:NERDTreeQuitOnOpen = 1
" " Hide some text from header
" let g:NERDTreeMinimalUI = 1
" " Set NERDtree initial window size
" let g:NERDTreeWinSize = 60
" " Change vim root also
" let g:NERDTreeChDirMode = 2
" " Nerdtree file highlighting
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1
" let g:NERDTreeLimitedSyntax = 1

" -- Narrow Region settings
" let g:nrrw_rgn_vert = 1
" let g:nrrw_rgn_wdth = 60
" let g:nrrw_rgn_incr = 60
" let g:nrrw_rgn_nohl = 1
" let g:nrrw_rgn_protect = 'n'
" let g:nrrw_topbot_leftright = 'botright'


" Coding
" -------

" -- Matchup settings
" Turn off match highlighting in insert mode
let g:matchup_matchparen_nomode = 'i'
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_deferred_show_delay = 90

" -- DelimitMate settings
" Make <CR> (enter) and <space> also expand at the end
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" -- Tagalong settings
let g:tagalong_verbose = 1

" -- Auto-pairs settings
" Don't make Backspace delete brackets and quotes in pairs
" let g:AutoPairsMapBS = 0
" let g:AutoPairsShortcutFastWrap = '<C-b>w'
" let g:AutoPairsShortcutBackInsert = '<C-b>b'


" Visual
" -------

" -- Vim-polyglot settings
let g:csv_no_conceal = 1

" -- Vim-Airline
" let g:airline_theme='gruvbox'
let g:airline_theme='raven'
" let g:airline_theme='violet'
" Enable Powerline fonts
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
" Change path display
let g:airline#extensions#tabline#formatter = 'unique_tail'
" Edit linenr (z) section
let g:airline_section_z = '%p%% ☰  %l/%L:%c | %{strftime("%H:%M")}'

" -- Smoothie settings
let g:smoothie_update_interval = 5
let g:smoothie_base_speed = 5




" --------------
" Abbreviations
" --------------

iabbrev clog; console.log();<Left><Left>
iabbrev dbg; debugger;
iabbrev vd; var_dump();<Left><Left>




" ------------
" Keybindings
" ------------

" Change default backspace behaviour to remove more characters.
set backspace=indent,eol,start

noremap <SPACE> <NOP>
let mapleader = "\<Space>"

" Save faster
" nnoremap hl :w<CR>
" nnoremap <leader>s :w<CR>

" Navigate splits easier
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Make tab jump to matching bracket
nmap <TAB> %
vmap <TAB> %
nmap z<TAB> z%
vmap z<TAB> z%
" J & H in visual mode jump to matching bracket
vmap J <ESC>]%V[%
vmap K <ESC>[%V]%
" Make { and } jump to parent bracket (instead of normal behaviour of jumping blocks)
nnoremap { [{
nnoremap } ]}

" Correct indenting when pasting
nnoremap p p=`]

" Send selection to host clipboard
" TODO fix only sending visual selection to clipboard, not whole line. Maybe use PrintGivenRange()
xnoremap Y :w !it2copy<CR><CR>

" Replace word under cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left>
vnoremap <leader>r :s/\<<C-r><C-w>\>//gc<Left><Left>

" :nnoremap gr :grep <cword> *<CR>
" :nnoremap Gr :grep <cword> %:p:h/*<CR>
" :nnoremap gR :grep '\b<cword>\b' *<CR>
" :nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

" Remove search highlighting
nnoremap <leader><Esc> :nohlsearch<CR>

" Search for selected text, forwards or backwards.
" vnoremap <silent> * :<C-U>
"   \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"   \gvy/<C-R><C-R>=substitute(
"   \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"   \gV:call setreg('"', old_reg, old_regtype)<CR>
" vnoremap <silent> # :<C-U>
"   \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"   \gvy?<C-R><C-R>=substitute(
"   \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"   \gV:call setreg('"', old_reg, old_regtype)<CR>


" Plugin keybindings
" -------------------

" -- Yoink
" nmap <c-n> <plug>(YoinkPostPasteSwapBack)
" nmap <c-p> <plug>(YoinkPostPasteSwapForward)
" nmap p <plug>(YoinkPaste_p)
" nmap P <plug>(YoinkPaste_P)

" -- Vim Clap
" inoremap <silent> <buffer> <C-l> <C-R>=clap#handler#tab_action()<CR>
" inoremap <silent> <buffer> <C-l> <C-R>=clap#handler#tab_action()<CR>
" inoremap <silent> <buffer> <C-l> <C-R>:call tab_action()<CR>
" inoremap <silent> <buffer> <C-d> :<c-u>call clap#navigation#scroll('down')<CR>

" -- FZF
" Search in current file
nnoremap <leader>f :BLines!<CR>
" Search for visual selection with Rg
vnoremap <leader>f :call RgWithGivenRange()<CR>
" Search in all files
" nnoremap <leader>F :Rgfzf!<CR>
" Search current word in file
" nnoremap <leader>* :BLines! <C-R><C-W><CR>
" Search current word in all files in current pwd
" nnoremap <leader>** :Rg! <C-R><C-W><CR>
" vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" vnoremap <leader>** y:Rg! <CR>=escape(@",'/\')<CR>
" vnoremap <leader>** y:Rg! <CR>hej
" Change buffer
nnoremap <leader>b :Buffers<CR>

" Netrw
" map <leader>e :Explore<CR>

" Vaffle explorer keys
map <leader>e :Vaffle<CR>
map <leader>E :Vaffle %<CR>
function! s:customize_vaffle_mappings() abort
    " Customize key mappings here
    nmap <buffer> <Bslash> <Plug>(vaffle-open-root)
    nmap <buffer> cd <Plug>(vaffle-chdir-here)
    nmap <buffer> J <Plug>(vaffle-toggle-current)
endfunction

augroup vimrc_vaffle
    autocmd!
    autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END

" -- NerdTree
" map <leader>e :NERDTreeToggle<CR>
" map <leader>E :NERDTreeFind<CR>

" -- Tagbar
" nmap <leader>o :TagbarToggle<CR>

" -- Easymotion
map <leader>F <Plug>(easymotion-sn)
map <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
" Jumpsearch for two chars, even across windows
nmap <leader>s <Plug>(easymotion-overwin-f2)
" nmap <leader>s <Plug>(easymotion-s2)
" nmap <leader>t <Plug>(easymotion-t2)
" map <leader>m <Plug>(easymotion-next) "n and N works just as good
" map <leader>M <Plug>(easymotion-prev)
" HJKL  motions: Line & column motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>h <Plug>(easymotion-linebackward)

" -- Coc settings
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Show yank list
nnoremap <silent> <leader>p  :<C-u>CocList -A --normal yank<cr>
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
" highlight CocHighlightText ctermfg=Blue guifg=#0000ff
" Highlight text for yanks
hi HighlightedyankRegion term=bold ctermbg=178 guibg=#d7af00 ctermfg=173 guifg=#d7875f




" --------------
" Functionality
" --------------

" -- Create dirs automatically when saving files
au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')

" -- Save on focus lost
au FocusLost * :wa


" Triger `autoread` when files changes on disk
" --------------------------------------------

" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd InsertEnter,FocusGained,BufEnter * if mode() != 'c' | checktime | endif


" Ripgrep
" Make Ripgrep only search file contents, not file names
" ------------------------------------------------------

" command! -bang -nargs=* Rg
" \ call fzf#vim#grep(
" \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
" \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
" \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'), \   <bang>0)

" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" :Fif - Find in files with fuzzy search
command! -bang -nargs=* Fif
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
            \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
            \   <bang>0)

" :Fzf - Find in files and filenames with fuzzy search
command! -bang -nargs=* Fzf
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)

" :Fzfraw - Find in files and filenames with fuzzy search, --fixed-strings, allow custom arguments eg: -tless (search in less files only)
command! -bang -nargs=* Fzfraw
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case --fixed-strings '.<q-args>, 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)

" :Rg search with Ripgrep --fixed-strings (use literal text instead of regex pattern)
function! RipgrepOnly(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --fixed-strings %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec, 'up:60%'), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepOnly(<q-args>, <bang>0)

" :Rgraw search with Ripgrep (don't use shellescape so you can pass custom args) --fixed-strings (use literal text instead of regex pattern)
" 1 variant:
" command! -bang -nargs=* Rgraw call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " .
"             \ <q-args>, 1, <bang>0)
" 2 variant:
" function! RipgrepRaw(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --fixed-strings %s || true'
"   let initial_command = printf(command_fmt, a:query)
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec, 'up:60%'), a:fullscreen)
" endfunction
" command! -nargs=* -bang Rgraw call RipgrepRaw(<q-args>, <bang>0)

" :Rgall search with Ripgrep --fixed-strings (use literal text instead of regex pattern) --no-ignore (skip .gitignore rules)
function! RipgrepAll(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --fixed-strings --no-ignore %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec, 'up:60%'), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepAll(<q-args>, <bang>0)

" :Rgrx search with Ripgrep, will use regex pattern instead of literal string when searching
function! RipgrepRegex(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec, 'up:60%'), a:fullscreen)
endfunction
command! -nargs=* -bang Rgrx call RipgrepRegex(<q-args>, <bang>0)

" Send visual selection to Ripgrep
function! RgWithGivenRange() range
    " Get the line and column of the visual selection marks
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]

    " Get all the lines represented by this range
    let lines = getline(lnum1, lnum2)

    " The last line might need to be cut if the visual selection didn't end on the last column
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
    " The first line might need to be trimmed if the visual selection didn't start on the first column
    let lines[0] = lines[0][col1 - 1:]

    " Get the desired text
    let selectedText = join(lines, "\n")

    " Do the call to external function
    " execute "Rg! " . selectedText
    call RipgrepOnly(selectedText, 1)
endfunction


" Preview files when searching
" ----------------------------

" Old hacky way
" let g:fzf_files_options =
" \ '--preview "(bat --style=numbers --color=always {} || less {}) 2> /dev/null | head -'.&lines.'"'
" New better way using fzf#vim#with_preview()  /from Viktor
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
