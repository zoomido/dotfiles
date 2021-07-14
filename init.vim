" ------------------------------------------------------------------------------
"   Vim-plug
" ------------------------------------------------------------------------------


call plug#begin('~/.vim/neoplugged')

" -- Generic Tools
Plug 'kassio/neoterm'                    " Wrapper to reuse same terminal
Plug 'junegunn/fzf', {
            \ 'do': './install --all' }   " Install fzf globally with vim-plug
                                         " Plug 'junegunn/fzf', {
                                         " \ 'dir': '~/.fzf',
"            \ 'do': './install --all' } " Install fzf globally with vim-plug and specify a dir (don't remember why the dir though?)
Plug 'junegunn/fzf.vim'                  " Fzf <3 Vim
" Plug 'yuki-ycino/fzf-preview.vim'        " Interface for fzf
" Plug 'Yggdroot/LeaderF',               " LeaderF interactive fuzzy finder
                                         " \ { 'do': './install.sh' }
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' } " Fuzzy finder in floating window
Plug 'tpope/vim-surround'                " Vim surround command 's'
" Plug 'simnalamburt/vim-mundo'            " Show vim's undotree in a graphical way
Plug 'easymotion/vim-easymotion'         " Move around easier
" Plug 'junegunn/vim-easy-align'           " Align text
Plug 'mhinz/vim-startify'                " Start screen for vim
Plug 'junegunn/vim-peekaboo'             " Peek in the registers before pasting
Plug 'svermeulen/vim-cutlass'            " use the black hole register for: c, cc, C, s, S, d, dd, D, x, X

" -- Tree explorers
Plug 'cocopon/vaffle.vim'                " Easy tree explorer
Plug 'kevinhwang91/rnvimr'               " Open ranger in floating window

" -- Coding tools
" Plug 'vim-vdebug/vdebug'            " Debugger for DBGP protocol (eg. xdebug for php)
Plug 'tpope/vim-commentary'         " Vim commentary for commenting
Plug 'airblade/vim-rooter'          " Set the working dir to closest VCS root
Plug 'airblade/vim-gitgutter'       " Show Git changes in gutter
" Plug 'mhinz/vim-signify'          " Shows VCS changes in file
Plug 'tpope/vim-fugitive'           " Git wrapper for vim
Plug 'idanarye/vim-merginal'        " Interface for Git branches :Merginal
Plug 'samoshkin/vim-mergetool'      " Mergetool for vim
" Plug 'andymass/vim-matchup'       " Better % (matching html tags)
Plug 'AndrewRadev/tagalong.vim'     " Edit HTML tags together automatically
Plug 'Raimondi/delimitMate'         " Auto closing pairs but nicer
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'pangloss/vim-javascript'      " Better javascript indent and syntax highlighting
" Plug 'tpope/vim-dadbod'             " SQL for Vim
" Plug 'kristijanhusak/vim-dadbod-ui' " DadbodUI for visual navigation

" Tabnine AI autocompletion
Plug 'zxqfl/tabnine-vim'

" Plug 'autozimu/LanguageClient-neovim', {
" \   'branch': 'next',
" \   'do': 'bash install.sh',
" \}
" Plug 'roxma/LanguageServer-php-neovim',  {
" \   'do': 'composer install && composer run-script parse-stubs'}

" Coc for autocompletion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" Plug 'antonk52/coc-cssmodules', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
" Plug 'marlonfan/coc-phpls', {'do': 'yarn install'}
" Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}          " Highlight yanks & provide persist yank list cross vim instance
""" Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " Highlight symbol of current position
""" Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}     " Auto create pairs ({' etc
""" Plug 'voldikss/coc-todolist', {'do': 'yarn install --frozen-lockfile'}  " Create todos

" -- Visual improvements
Plug 'pacha/vem-tabline'                " Tabline plugin to show buffers
Plug 'chriskempson/base16-vim'          " Load base16 colorscheme into vim
" Plug 'sheerun/vim-polyglot'             " Better syntax highlighting
" Plug 'junegunn/rainbow_parentheses.vim' " Make matching parentheses same color
Plug 'psliwka/vim-smoothie'             " Smooth scrolling with Ctrl+D,U,F,B
Plug 'RRethy/vim-illuminate'            " Highlight same words
Plug 'machakann/vim-highlightedyank'    " Highlight yanks
" Plug 'vim-airline/vim-airline'          " Airline statusline
" Plug 'vim-airline/vim-airline-theme
" Plug 'inside/vim-search-pulse'          " Highlight search
" Plug 'ryanoasis/vim-devicons'           " Devicons

" -- Theme
" Plug 'axvr/photon.vim'
" Plug 'andreypopp/vim-colors-plain'
" Plug 'arzg/vim-colors-xcode'
" Plug 'rakr/vim-one'
" Plug 'morhetz/gruvbox'
" Plug 'cideM/yui'
" Plug 'lurst/austere.vim' "austere
Plug 'davidosomething/vim-colors-meh' "meh
" Plug 'pgdouyon/vim-yin-yang' "yin
" Plug 'pgdouyon/vim-alayas' "vimalayas
" Plug 'nikolvs/vim-sunbather' "sunbather

" Initialize plugin system
call plug#end()




" ------------------------------------------------------------------------------
"   General settings
" ------------------------------------------------------------------------------


" set shell=/bin/bash     " Start with bash
" set shell=/usr/local/bin/fish     " Start with fish
set updatetime=500      " Set shorter updatetime for many commands
set hidden              " Set buffers to hide when changing between them (will silence save error)
set ignorecase          " Ignore case when searching
set smartcase           " Use case-sensitive only search when Captial Letters are used.
set gdefault            " Set /g as the default option when doing search and replace
set expandtab           " Insert spaces when TAB is pressed.
set softtabstop=4       " Change number of spaces that a <Tab> counts for during editing ops
set shiftwidth=4        " When indenting with '>>', '<<' or '==', use 4 spaces width. Also for auto indent.
set shortmess=atc       " Don't require ENTER when changing buffers (a), truncate long messages (t) and don't give ins-completion messages (c)
set cmdheight=2         " Set the height of the command line window
set splitright          " Open splits to right
set splitbelow          " Open splits below
set undofile            " Set undofile to autosave all changes in an external file
set inccommand=nosplit  " Neovim only. inccommand shows you in realtime what changes your ex command should make. Right now it only supports s.
autocmd FileType * setlocal formatoptions-=cro   " Dont add a comment on newline
" autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin      " Use js beautifier on javascript files

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd InsertEnter,FocusGained,BufEnter * if mode() != 'c' | checktime | endif




" ------------------------------------------------------------------------------
"   Project specifics or other local settings
" ------------------------------------------------------------------------------


" Source all files in a dir
function! SourceDirectory(path)
    for s:fpath in split(globpath(a:path, '*.vim'), '\n')
        exe 'source' s:fpath
    endfor
endfunction

" Source all files in this dir
call SourceDirectory('~/dotfiles-private')

" Source dadbod.vim
" source ~/dotfiles-private/dadbod.vim
" Source project.vim
" source ~/dotfiles-private/project.vim

" Autocmd to run gulp, WIP
" autocmd BufWritePost */var/www/**/*.less :vsplit term://gulp css
" autocmd BufWritePost * ++nested split term://gulp
" trying this --
" autocmd BufWritePost */var/www/**/*.less ++nested vsplit term://gulp css




" ------------------------------------------------------------------------------
"   Appearance
" ------------------------------------------------------------------------------

" Set this below .vimrc_background to override it
" silent! colorscheme base16-default-dark " Colorscheme (add silent! to supress error during first launch)

" Use base16 theme from terminal
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set termguicolors       " Use 24-bit color
set nonumber            " Turn numbers off
set noshowmode          " Don't show mode at the bottom (will show in statusline instead)
set scrolloff=5         " Turn on scroll margin up/down
set sidescrolloff=5     " Turn on scroll margin left/right
set list                " Show tabs, nbsp and trailing spaces
set winblend=5          " Set transparency for floating windows
colorscheme meh

" Highlight the current line
set cursorline
" highlight CursorLine guibg=#222244
" autocmd InsertEnter * highlight CursorLine guibg=#333366
" autocmd InsertLeave * highlight CursorLine guibg=#333333

" Change default highlighting of word under cursor
" hi MatchParenCur cterm=bold,underline gui=bold,underline

" Highlight column over 120 chars
call matchadd('ColorColumn', '\%121v', 100)
highlight ColorColumn ctermbg=69 guibg=DodgerBlue

" Change background of signcolumn
" highlight clear SignColumn
autocmd BufEnter * highlight SignColumn ctermbg=0 guibg=0

" Turn off search highlighting when exiting insert mode
" au InsertLeave * :let @/=""

" Gruvbox settings
" let g:gruvbox_contrast_dark='medium'




" ------------------------------------------------------------------------------
"   General keybindings
" ------------------------------------------------------------------------------


" Change default backspace behaviour to remove more characters.
" set backspace=indent,eol,start

noremap <SPACE> <NOP>
let mapleader = "\<Space>"

" Make Y yank to end of line (as C & D)
map Y y$

" Make p and P use the 0 register by default so same text can be pasted again. But preserve behaviour for other registers
noremap p "0p
noremap P "0P
for s:i in ['"','*','+','-','.',':','%','/','=','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    execute 'noremap "'.s:i.'p "'.s:i.'p'
    execute 'noremap "'.s:i.'P "'.s:i.'P'
endfor

" Use + to cut text
vnoremap + d
nnoremap ++ dd

" Testing the cutlass plugin for this instead
" Don't copy text when changing it
" nnoremap c "_c
" nnoremap C "_C

" Put deleted text in black hole register
" nnoremap d "_d
" nnoremap D "_D
" nnoremap dd "_dd

" Move j & k in wrapped lines too, unless a count is provided before
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

" w - save a file | W - save and quit
nnoremap <leader>w <Cmd>w<CR>
nnoremap <leader>W <Cmd>wq<CR>

" q - delete/close buffer | Q - quit
nnoremap <leader>q <Cmd>bwipeout<CR>
nnoremap <leader>Q <Cmd>quit<CR>

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

" Make { and } jump to parent bracket (instead of normal behaviour of jumping blocks)
nnoremap { [{
nnoremap } ]}

" Select whole row except newline char
" vnoremap <silent> al :<C-u>norm!0v$h<CR>
vnoremap <silent> il :<C-u>norm!^vg_<CR>

" Auto indent when pasting
nnoremap p p=`.`.

" Replace word under cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>//c<Left><Left>
vnoremap <leader>r :s/\<<C-r><C-w>\>//c<Left><Left>

" Search visual selection
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" Remove search highlighting
nnoremap <leader><Esc> <Cmd>nohlsearch<CR>

"   Terminal keymaps
" --------------------
"   <C-h>   - Change to left window
"   <C-j>   - Change to bottom window
"   <C-k>   - Change to top window
"   <C-l>   - Change to right window
"   <Esc>   - Escape to exit insert mode in terminal
"   Above mappings don't apply to fzf buffer
"   Fzf buffer
"   <C-l>   - Accept current selection
tnoremap <expr> <C-h> (&filetype == "fzf") ? "<C-h>" : "<C-\><C-n><C-w>h"
tnoremap <expr> <C-j> (&filetype == "fzf") ? "<C-j>" : "<C-\><C-n><C-w>j"
tnoremap <expr> <C-k> (&filetype == "fzf") ? "<C-k>" : "<C-\><C-n><C-w>k"
tnoremap <expr> <C-l> (&filetype == "fzf") ? "<C-l>" : "<C-\><C-n><C-w>l"
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<C-\><C-n>"
autocmd FileType fzf tnoremap <buffer> <C-l> <CR>
" autocmd TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>     " Use escape to exit insert mode in terminal
" autocmd FileType fzf tunmap <buffer> <Esc>                " Unmap escape in fzf buffers
" tnoremap <silent> <leader>t <C-\><C-n>:Ttoggle<CR>        " Will mess with <Space> in fzf because it opens in a terminal buffer
nnoremap <silent> <leader>t :vertical botright Ttoggle<CR>
nnoremap <silent> <leader>T :belowright Tnew<CR>

"   Run commands
" ----------------
nnoremap <leader>c :w<CR>:T gulp css && exit<CR>
nnoremap <leader>C :w<CR>:T m2c && gulp css && exit<CR>



" ------------------------------------------------------------------------------
"   Plugin settings
" ------------------------------------------------------------------------------

" ### Generic Tools

"   Neoterm settings
" --------------------
let g:neoterm_autoinsert = 1                    " Autostart new terminal in insert mode
let g:neoterm_default_mod = 'vertical botright' " Set default terminal location


"   Vim Clap settings
" ---------------------
" let g:clap_theme = 'material_design_dark'
" let g:clap_layout = {'width': '90%', 'height': '90%', 'row': '5%', 'col': '5%'}
" let g:clap_disable_run_rooter = v:true


"   FZF settings & keys
" -----------------------
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
" let $FZF_DEFAULT_OPTS=' --color=dark --layout=reverse --margin=1,4 --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --preview '

let g:fzf_command_prefix = 'Fzf'                                " Set a prefix for all commands. Type Fzf<Tab> to show all options
let g:fzf_preview_window = 'down:25'                            " Set the default preview window location and size
let g:fzf_small_preview_window = 'down:16'                      " Custom command for smaller preview window
let g:fzf_layout = { 'window': {'width': 0.95, 'height': 0.9} } " Open fzf in a floating window
let g:fzf_history_dir = '~/.local/share/fzf-history'            " Enable per-command history in specified dir. CTRL-N & CTRL-P for next-history & previous-history

" -- Keys
nnoremap <leader>b  <Cmd>FzfBuffers<CR>
nnoremap <leader>f  <Cmd>FzfFiles<CR>
nnoremap <leader>l  <Cmd>FzfLinesWithPreview<CR>
nnoremap <leader>L  <Cmd>FzfLines<CR>
nnoremap <leader>g  <Cmd>FzfRg<CR>
nnoremap <leader>G  <Cmd>RG<CR>
nnoremap <leader>G! <Cmd>RG!<CR>
vnoremap <leader>g  :call RgWithGivenRange()<CR>
" xnoremap <leader>g  "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"

" -- Fzf functions
" Make the preview window smaller for buffer listing
command! -bang -nargs=? -complete=dir FzfBuffers
    \ call fzf#vim#buffers(fzf#vim#with_preview(g:fzf_small_preview_window), <bang>0)

" Use Rg to search in the current file - with preview (woho!)
command! -bang -nargs=* FzfLinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --with-filename . ' . fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort'}, g:fzf_small_preview_window)
    \ )

" Search with Rg {add ! to search hidden files}
function! RipgrepFzf(query, searchAll)
    let hidden = ''
    if (a:searchAll)
        let hidden = '--hidden --no-ignore'
    endif
    let command_fmt = 'rg --fixed-strings --column --line-number --no-heading --color=always --smart-case ' . hidden . ' %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    " call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec, 'down:20'), a:fullscreen) " Use this for custom preview location
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec, g:fzf_preview_window), 1)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

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
    call RipgrepFzf(selectedText, 0)
endfunction

" Disable statusline in fzf (terminal) buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
            \| autocmd BufLeave <buffer> set laststatus=2 ruler


"   FZFPreview settings & keys
" ------------------------------
" let g:fzf_preview_use_dev_icons = 1             " Use vim-devicons
" let g:fzf_preview_use_floating_window = 0       " Use floating window
let g:fzf_preview_floating_window_winblend = 5
let g:fzf_preview_floating_window_rate = 0.95   " floating window size ratio
let g:fzf_preview_if_binary_command = "test (file -b --mime-encoding {}) = 'binary'"  " g:fzf_binary_preview_command is executed if this command succeeds, and g:fzf_preview_command is executed if it fails
let g:fzf_preview_lines_command = "bat --color=always --plain"
let g:fzf_preview_fzf_preview_window_option = "down:20"
" let g:fzf_preview_fzf_color_option = "fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C,pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B"
let g:fzf_preview_preview_key_bindings = "ctrl-d:preview-down,ctrl-u:preview-up,ctrl-p:toggle-preview,ctrl-w:toggle-preview-wrap,ctrl-l:accept,ctrl-h:clear-query"

" -- Keys
" nnoremap <leader>l  <Cmd>FzfPreviewLines -add-fzf-arg=--color='border:#ffff00,info:#ffff00'<CR>
" nnoremap <leader>b  <Cmd>FzfPreviewBuffers<CR>
" nnoremap <leader>f  <Cmd>FzfPreviewDirectoryFiles<CR>
" nnoremap <leader>g  <Cmd>FzfPreviewProjectGrep -add-fzf-arg=--nth=3<Space>.<CR>
" nnoremap <leader>G  <Cmd>FzfPreviewProjectGrep<Space>.<CR>
" xnoremap <leader>g  "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
" nmap <leader>c  [fzf-p]
" xmap <leader>c  [fzf-p]
" nnoremap <silent> [fzf-p]gf  <Cmd>FzfPreviewGitFiles<CR>
" nnoremap <silent> [fzf-p]gs  <Cmd>FzfPreviewGitStatus<CR>
" nnoremap <silent> [fzf-p]ph  <Cmd>FzfPreviewProjectOldFiles<CR>
" nnoremap <silent> [fzf-p]h   <Cmd>FzfPreviewOldFiles<CR>
" nnoremap <silent> [fzf-p]c   <Cmd>FzfPreviewChanges<CR>
" nnoremap <silent> [fzf-p]j   <Cmd>FzfPreviewJumps<CR>
" nnoremap <silent> [fzf-p]m   <Cmd>FzfPreviewMarks<CR>
" nnoremap <silent> [fzf-p]q  <Cmd>FzfPreviewQuickFix<CR>
"" nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR>
"" nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>


"   Mundo settings
" ------------------
let g:mundo_width = 120
let g:mundo_preview_height = 25
let g:mundo_right = 1
let g:mundo_inline_undo = 1
" let g:mundo_preview_bottom = 1


"   Easymotion settings & keys
" ------------------------------
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" -- Keys
" Search for two chars - s{char}{char} to move to {char}{char}
nmap <leader>s <Plug>(easymotion-overwin-f2)
" Search for any number of chars
nmap <leader>S <Plug>(easymotion-sn)
" map  <leader>/ <Plug>(easymotion-sn)
" omap <leader>/ <Plug>(easymotion-tn)


"   Startify settings
" --------------------
let g:startify_session_persistence = 1 " Autosave sessions on exit when leaving vim and loading a new session
let g:startify_update_oldfiles = 0     " Update v:oldfiles on-the-fly
" let g:startify_relative_path = 1     " Show files with or without relativ path
let g:startify_change_to_dir = 0       " Don't change to files dir when opening
" let g:startify_change_to_vcs_root = 1  " Change to VCS dir if there is one (git & hg)
let g:startify_restore_position = 1    " Jump to last position when opening a file
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
            \ {'cf': '~/.dotfiles/config.fish'},
            \ {'ci': '~/.dotfiles/init.vim'},
            \ {'cz': '~/.dotfiles/zshrc'},
            \ {'ch': '~/.dotfiles/hammerspoon/init.lua'},
            \ {'cs': '~/.dotfiles/surfingkeys.js'},
            \ {'ck': '~/.dotfiles/kitty.conf'}
            \ ]
" How many files to display in the files & dir lists
let g:startify_files_number = 5


"   Peekabo settings
" -------------------
let g:peekaboo_delay = 1000


" ### Tree explorers


"   Vim Vaffle settings & keys
" -----------------------------
let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

" -- Keys
map <leader>E <Cmd>Vaffle<CR>
map <leader>e <Cmd>Vaffle %<CR>
" function! s:customize_vaffle_mappings() abort
"     " Customize key mappings here
"     nmap  <buffer> <Bslash> <Plug>(vaffle-open-root)
"     nmap  <buffer> cd       <Plug>(vaffle-chdir-here)
"     nmap  <buffer> J        <Plug>(vaffle-toggle-current)
"     nmap  <buffer> <Tab>    <Plug>(vaffle-toggle-current)
"     nmap  <buffer> <S-Tab>  <Plug>(vaffle-toggle-current)kk
"     nmap  <buffer> <Esc>    <Plug>(vaffle-quit)
"     unmap <buffer> <space>
" endfunction
" augroup vimrc_vaffle
"     autocmd!
"     autocmd FileType vaffle call s:customize_vaffle_mappings()
" augroup END


"   Rnvimr settings
" -----------------------------
" nnoremap <silent> <leader>e :RnvimrToggle<CR>
" tnoremap <silent> <leader>e <C-\><C-n>:RnvimrToggle<CR>
" tnoremap <silent> <Esc> q
" let g:rnvimr_ranger_cmd = 'ranger'
" let g:rnvimr_vanilla = 1 " Use vanilla ranger config
" let g:rnvimr_enable_ex = 1 " Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_picker = 1 " Make Ranger to be hidden after picking a file
" let g:rnvimr_hide_gitignore = 1 " Hide the files included in gitignore
" let g:rnvimr_draw_border = 0 " Border for floating window
" let g:rnvimr_border_attr = {'fg': 14, 'bg': 13} " Change the border's color
" Fullscreen for initial layout
" let g:rnvimr_layout = {
"             \ 'relative': 'editor',
"             \ 'width': float2nr(1.0 * &columns),
"             \ 'height': float2nr(1.0 * &lines) - 2,
"             \ 'col': 0,
"             \ 'row': 0,
"             \ 'style': 'minimal'
"             \ }
" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.9 * &columns)),
            \ 'height': float2nr(round(0.9 * &lines)),
            \ 'col': float2nr(round(0.05 * &columns)),
            \ 'row': float2nr(round(0.05 * &lines)),
            \ 'style': 'minimal'
            \ }


" ### Coding tools


"   Vdebug settings
" ------------------
let g:vdebug_keymap = {
\    "run_to_cursor" : "<Leader><Left>",
\    "step_over" : "<Leader><Down>",
\    "step_into" : "<Leader><Right>",
\    "step_out" : "<Leader><Up>",
\    "get_context" : "<Leader>c"
\}


"   Gitgutter settings
" ----------------------
" let g:gitgutter_override_sign_column_highlight = 0  " Don't override default bg color
highlight GitGutterAdd    guifg=#009900 guibg=0 ctermfg=2 ctermbg=0
highlight GitGutterChange guifg=#bbbb00 guibg=0 ctermfg=3 ctermbg=0
highlight GitGutterChangeDelete guifg=#ee80ee guibg=0 ctermfg=4 ctermbg=0
highlight GitGutterDelete guifg=#ff2222 guibg=0 ctermfg=1 ctermbg=0


"   Fugitive settings
" ---------------------
nmap <leader>Gs :Gstatus<CR><C-w>5+
" Fugitive Conflict Resolution
" nnoremap <leader>gd :Gvdiff<CR>
" nnoremap gdh :diffget //2<CR>
" nnoremap gdl :diffget //3<CR>


"   Matchup settings
" --------------------
" let g:matchup_matchparen_nomode = 'i'               " Turn off match highlighting in insert mode
" let g:matchup_surround_enabled = 1                  " Activate ds% and cs%
" let g:matchup_matchparen_deferred = 1               " Wait for cursor movement to stop
" let g:matchup_matchparen_deferred_show_delay = 90   " Timeout to wait


"   Tagalong settings
" ---------------------
" Print out a message every time it auto-updates a closing/opening tag
let g:tagalong_verbose = 1


"   DelimitMate settings
" ------------------------
" let delimitMate_autoclose = 0       " Turn off automagic closing of pairs
let delimitMate_matchpairs = "[:],{:},<:>"
let delimitMate_expand_cr = 1       " Expand <CR> (Enter) when inserting {}
let delimitMate_expand_space = 1    " Expand space at the end too
let delimitMate_quotes = ""         " Turn off quote completion


"   Tabnine (YCM) settings
" --------------------------
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist = {
        \ 'peekaboo' : 1,
        \ 'text': 1
        \}


"   Coc settings & keys
" ----------------------
"" Everything is commented out
" "   <leader>gd    - Jump to definition of current symbol
" "   <leader>gr    - Jump to references of current symbol
" "   <leader>gi    - Jump to implementation of current symbol
" "   <leader>gs    - Fuzzy search current project symbols
" "   <leader>p     - Show yanklist
" "   <(S-)tab>     - Navigate autocompletion list
" "   <leader>D     - Show documentation for current symbol
" nmap <silent> <leader>gd <Plug>(coc-definition)
" nmap <silent> <leader>gr <Plug>(coc-references)
" nmap <silent> <leader>gi <Plug>(coc-implementation)
" nnoremap <silent> <leader>gs :<C-u>CocList -I -N --top symbols<CR>
" nnoremap <silent> <space>p   :<C-u>CocList -A --normal yank<cr>
" vnoremap <silent> <space>p   :<C-u>CocList -A --normal yank<cr>
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " use <tab> for trigger completion and navigate to the next complete item
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" " Use D to show documentation in preview window.
" nnoremap <silent> <leader>D :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" " Special jump to symbol under cursor
" " nnoremap <silent> <leader>gs :exe 'CocList -I --normal --input='.expand('<cword>').' symbols'<CR>


" ### Visual improvements


"   Smoothie settings
" ---------------------
let g:smoothie_update_interval = 5
let g:smoothie_base_speed = 5


"   Illuminate current word
" --------------------------
let g:Illuminate_delay = 1000
" Change color of current symbol highlight
highlight illuminatedWord cterm=underline ctermbg=60 gui=underline guibg=MediumPurple4




" ------------------------------------------------------------------------------
"   Abbreviations
" ------------------------------------------------------------------------------


iabbrev clog; console.log();<Left><Left><Space><Left>
iabbrev dbg; debugger;
iabbrev vd; var_dump();<Left><Left><Space><Left>




" ------------------------------------------------------------------------------
"   Functions
" ------------------------------------------------------------------------------


" Search for visual selection
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
  norm! #
endfunction




" ------------------------------------------------------------------------------
"   Custom statusline
" ------------------------------------------------------------------------------


" function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction

" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction

" set statusline=
" set statusline+=%#PmenuSel#
" " set statusline+=%{StatuslineGit()}
" set statusline+=\ %{FugitiveHead(5)}
" set statusline+=\ %#LineNr#
" set statusline+=\ %f
" set statusline+=%m
" set statusline+=%=
" set statusline+=%#CursorColumn#
" set statusline+=\ %y
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
" set statusline+=\ %p%%
" set statusline+=\ %l:%c
" " set statusline+=\


" Statusline & Tabline/Buffer line
" ---------------------------------
" Statusline
" https://github.com/Greduan/dotfiles/blob/76e16dd8a04501db29989824af512c453550591d/vim/after/plugin/statusline.vim

let g:currentmode={
      \ 'n'  : 'N ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'V ',
      \ 'V'  : 'V·Line ',
      \ "\<C-V>" : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ 'x19' : 'S·Block ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}


" " Automatically change the statusline color depending on mode
" function! ChangeStatuslineColor()
"   if (mode() =~# '\v(n|no)')
"     exe 'hi! StatusLine ctermfg=008 guifg=fgcolor gui=None cterm=None'
"   elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
"     exe 'hi! StatusLine ctermfg=005 guifg=#00ff00 gui=None cterm=None'
"   elseif (mode() ==# 'i')
"     exe 'hi! StatusLine ctermfg=004 guifg=#6CBCE8 gui=None cterm=None'
"   else
"     exe 'hi! StatusLine ctermfg=006 guifg=orange gui=None cterm=None'
"   endif

"   return ''
" endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

" Set custom colors
hi User1 guibg=#444444 guifg=#CCCCCC
hi User2 guibg=None guifg=#FFAAEE
hi User3 guibg=None guifg=#DDDDDD
hi User4 guibg=None guifg=#888888
" powerline symbols
"       ☰ ''

" http://stackoverflow.com/a/10416234/213124
set laststatus=2
set statusline=
" " set statusline+=%{ChangeStatuslineColor()}                 " Changing the statusline color
set statusline+=%1*\ %{toupper(g:currentmode[mode()])}       " Current mode
" " set statusline+=%8*\ [%n]                                  " buffernr
set statusline+=%#Conditional#                               " Set color of gitstatus
set statusline+=\ %{GitInfo()}                               " Git Branch name
set statusline+=%4*\ \                                      " Separator
set statusline+=%3*%<%f\ %{ReadOnly()}\ %m\ %w\              " File+path
set statusline+=%9*\ %=                                      " Space
set statusline+=%4*\ %y                                      " FileType
set statusline+=%4*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\     " Encoding & Fileformat
set statusline+=%4*%-3(%{FileSize()}%)                       " File size
set statusline+=%4*\                                        " Separator
set statusline+=%4*\ %3p%%\ ☰\                               " Rownumber/total (%)
set statusline+=%3*\ %l:%c\                                  " Rownumber/total (%)



" Another custom statusline
" --------------------------
" function! ActiveStatus()
"   let statusline=""
"   " let statusline.="%1*"
"   " let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%'):''}\ %)"
"   " let statusline.="%2*"
"   " let statusline.=""
"   let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
"   " let statusline.="%3*"
"   " let statusline.=""
"   let statusline.="%4*"
"   let statusline.="\ %<"
"   let statusline.="%f"
"   let statusline.="%{&modified?'\ \ +':''}"
"   let statusline.="%{&readonly?'\ \ ':''}"
"   let statusline.="%="
"   let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
"   let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
"   let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
"   " let statusline.="%3*"
"   " let statusline.="\ "
"   " let statusline.="%2*"
"   let statusline.="\ "
"   " let statusline.="%1*"
"   let statusline.="\ %2v"
"   let statusline.="\ %3p%%\ "
"   return statusline
" endfunction

" function! InactiveStatus()
"   let statusline=""
"   let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ \ ':'\ '}%)"
"   let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'\ '}"
"   let statusline.="\ %<"
"   let statusline.="%f"
"   let statusline.="%{&modified?'\ \ +':''}"
"   let statusline.="%{&readonly?'\ \ ':''}"
"   let statusline.="%="
"   let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
"   let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
"   let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
"   let statusline.="\ \ "
"   let statusline.="\ %2v"
"   let statusline.="\ %3p%%\ "
"   return statusline
" endfunction

" set laststatus=2
" set statusline=%!ActiveStatus()
" hi User1 guibg=#afd700 guifg=#005f00
" hi User2 guibg=#005f00 guifg=#afd700
" hi User3 guibg=#222222 guifg=#005f00
" hi User4 guibg=#222222 guifg=#d0d0d0

" augroup status
"   autocmd!
"   autocmd WinEnter * setlocal statusline=%!ActiveStatus()
"   autocmd WinLeave * setlocal statusline=%!InactiveStatus()
"   autocmd ColorScheme kalisi if(&background=="dark") | hi User1 guibg=#afd700 guifg=#005f00 | endif
"   autocmd ColorScheme kalisi if(&background=="dark") | hi User2 guibg=#005f00 guifg=#afd700 | endif
"   autocmd ColorScheme kalisi if(&background=="dark") | hi User3 guibg=#222222 guifg=#005f00 | endif
"   autocmd ColorScheme kalisi if(&background=="dark") | hi User4 guibg=#222222 guifg=#d0d0d0 | endif
"   autocmd ColorScheme kalisi if(&background=="light") | hi User1 guibg=#afd700 guifg=#005f00 | endif
"   autocmd ColorScheme kalisi if(&background=="light") | hi User2 guibg=#005f00 guifg=#afd700 | endif
"   autocmd ColorScheme kalisi if(&background=="light") | hi User3 guibg=#707070 guifg=#005f00 | endif
"   autocmd ColorScheme kalisi if(&background=="light") | hi User4 guibg=#707070 guifg=#d0d0d0 | endif
" augroup END
