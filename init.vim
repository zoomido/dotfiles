" ------------------------------------------------------------------------------
"   Vim-plug
" ------------------------------------------------------------------------------

call plug#begin('~/.vim/neoplugged')

" -- Generic Tools
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update. Dep for telescope
Plug 'nvim-lua/plenary.nvim'             " Dependency for telescope
Plug 'nvim-telescope/telescope.nvim'     " Search everything
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-live-grep-raw.nvim' " Raw search with rg
Plug 'AckslD/nvim-neoclip.lua'           " Clipboard manager
" Plug 'junegunn/fzf', {
    " \ 'do': './install --all' }        " Install fzf globally with vim-plug
" Plug 'junegunn/fzf.vim'                  " Fzf <3 Vim
" Plug 'yuki-ycino/fzf-preview.vim'        " Interface for fzf
" Plug 'Yggdroot/LeaderF',               " LeaderF interactive fuzzy finder
                                         " \ { 'do': './install.sh' }
Plug 'kassio/neoterm'                    " Wrapper to reuse same terminal
Plug 'mhinz/vim-startify'                " Start screen for vim
Plug 'tpope/vim-surround'                " Vim surround command 's'
Plug 'ggandor/lightspeed.nvim'           " Jump around based on labels
Plug 'svermeulen/vim-cutlass'            " use the black hole register for: c, cc, C, s, S, d, dd, D, x, X
" Plug 'junegunn/vim-easy-align'           " Align text
Plug 'vim-utils/vim-line'                " Add 'inner line' text object: _  v_  y_  d_

" -- Tree explorers
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'       " Use as default tree viewer
Plug 'yuki-yano/fern-preview.vim'        " Preview files
" Plug 'cocopon/vaffle.vim'                " Easy tree explorer
" Plug 'kevinhwang91/rnvimr'               " Open ranger in floating window

" -- Coding tools
" Plug 'vim-vdebug/vdebug'            " Debugger for DBGP protocol (eg. xdebug for php)
Plug 'tpope/vim-commentary'         " Vim commentary for commenting
Plug 'airblade/vim-rooter'          " Set the working dir to closest VCS root
" Plug 'airblade/vim-gitgutter'       " Show Git changes in gutter
Plug 'lewis6991/gitsigns.nvim'      " Show git changes in the gutter
Plug 'tpope/vim-fugitive'           " Git wrapper for vim
" Plug 'idanarye/vim-merginal'        " Interface for Git branches :Merginal
Plug 'samoshkin/vim-mergetool'      " Mergetool for vim
" Plug 'andymass/vim-matchup'       " Better % (matching html tags)
Plug 'AndrewRadev/tagalong.vim'     " Edit HTML tags together automatically
" Plug 'Raimondi/delimitMate'         " Auto closing pairs but nicer
" Plug 'captbaritone/better-indent-support-for-php-with-html'
" Plug 'pangloss/vim-javascript'      " Better javascript indent and syntax highlighting
" Plug 'tpope/vim-dadbod'             " SQL for Vim
" Plug 'kristijanhusak/vim-dadbod-ui' " DadbodUI for visual navigation
Plug 'Yggdroot/indentLine'        " Show indent markers

" Tabnine AI autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'hrsh7th/nvim-cmp'
Plug 'dcampos/nvim-snippy'              " Snippet engine in Lua for neovim
Plug 'dcampos/cmp-snippy'               " Plugin to use snippy with cmp

" -- Visual improvements
Plug 'pacha/vem-tabline'                " Tabline plugin to show buffers
Plug 'chriskempson/base16-vim'          " Load base16 colorscheme into vim
" Plug 'sheerun/vim-polyglot'             " Better syntax highlighting
" Plug 'junegunn/rainbow_parentheses.vim' " Make matching parentheses same color
Plug 'psliwka/vim-smoothie'             " Smooth scrolling with Ctrl+D,U,F,B
Plug 'machakann/vim-highlightedyank'    " Highlight yanks
" Plug 'inside/vim-search-pulse'          " Highlight search

" -- Theme
" Plug 'davidosomething/vim-colors-meh' "meh THIS IS FAVORITE THEME set theme
" Plug 'axvr/photon.vim'
" Plug 'andreypopp/vim-colors-plain'
" Plug 'arzg/vim-colors-xcode'
" Plug 'rakr/vim-one'
" Plug 'morhetz/gruvbox'
" Plug 'cideM/yui'
" Plug 'lurst/austere.vim' "austere
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
set completeopt=menu,menuone,noselect " Set completeopt to have a better completion experience
autocmd FileType * setlocal formatoptions-=cro   " Dont add a comment on newline

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
" colorscheme meh "Set theme

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


" Make p and P use the 0 register by default so same text can be pasted again.
vnoremap P "0p

" Auto indent when pasting
" nnoremap p p=`.`.

" Use + to cut text - Binding for cutlass
nnoremap + d
xnoremap + d
nnoremap ++ dd

" Testing the cutlass plugin for this instead
" Don't copy text when changing it
" nnoremap c "_c
" nnoremap C "_C

" Put deleted text in black hole register
" nnoremap d "_d
" nnoremap D "_D
" nnoremap dd "_dd

" vv selects whole line without end line marker
" xnoremap v v^vg_
" xnoremap v V
" Select whole row except newline char
" vnoremap <silent> al :<C-u>norm!0v$h<CR>
" vnoremap <silent> il :<C-u>norm!^vg_<CR>

" Move j & k in wrapped lines too, unless a count is provided before
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

" w - save a file | W - save and quit
nnoremap <leader>w <Cmd>w<CR>
" nnoremap <leader>W <Cmd>wq<CR>

" q - delete/close buffer | Q - quit
nnoremap <leader>q <Cmd>bwipeout<CR>
" nnoremap <leader>Q <Cmd>quit<CR>

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

" Replace word under cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>//c<Left><Left>
vnoremap <leader>r :s/\<<C-r><C-w>\>//c<Left><Left>

" Keep cursor centered when searching
nnoremap n nzzzv
nnoremap N Nzzzv

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
" tnoremap <expr> <C-h> (&filetype == "fzf") ? "<C-h>" : "<C-\><C-n><C-w>h"
" tnoremap <expr> <C-j> (&filetype == "fzf") ? "<C-j>" : "<C-\><C-n><C-w>j"
" tnoremap <expr> <C-k> (&filetype == "fzf") ? "<C-k>" : "<C-\><C-n><C-w>k"
" tnoremap <expr> <C-l> (&filetype == "fzf") ? "<C-l>" : "<C-\><C-n><C-w>l"
" tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<C-\><C-n>"
" autocmd FileType fzf tnoremap <buffer> <C-l> <CR>
" " autocmd TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>     " Use escape to exit insert mode in terminal
" " autocmd FileType fzf tunmap <buffer> <Esc>                " Unmap escape in fzf buffers
" " tnoremap <silent> <leader>t <C-\><C-n>:Ttoggle<CR>        " Will mess with <Space> in fzf because it opens in a terminal buffer
nnoremap <silent> <leader>t :vertical botright Ttoggle<CR>
nnoremap <silent> <leader>T :belowright Tnew<CR>



" ------------------------------------------------------------------------------
"   Plugin settings
" ------------------------------------------------------------------------------

" ### Lua plugin setup
lua <<EOF
require('gitsigns').setup()
EOF

" ### Generic Tools

"   Telescope settings
" ---------------------
lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        layout_strategy = "vertical",
        layout_config = {
            vertical = { width = 0.95, height = 0.95, preview_height = 0.3, preview_cutoff = 20 }
        },
        --layout_config = {
            --horizontal = { width = 0.95, height = 0.95 }
        --},
        path_display = {"absolute"},
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim"
        },
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
                ["<esc>"] = actions.close,
                ["<C-l>"] = actions.select_default,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
    pickers = {
        buffers = {
            path_display = {"absolute"},
            sort_mru = true,
            sort_lastused = true,
            layout_strategy = "vertical",
            layout_config = {
                vertical = { width = 0.95, height = 0.95, preview_height = 0.3, preview_cutoff = 20 }
            },
            mappings = {
                i = {
                }
            }
        },
    },
    extensions = {
    }
}

-- Plugins

require('telescope').load_extension('fzf')
require('neoclip').setup({
    -- default_register = '"',
    -- on_paste = {
    --    set_reg = false,
    -- },
    keys = {
        i = {
            paste = '<c-l>',
            paste_behind = '<c-h>',
        },
    },
})
require('telescope').load_extension('neoclip')

-- Custom functions

project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

function notes_browse()
  require("telescope.builtin").file_browser {
    prompt_title = " Browse Notes",
    prompt_prefix = " ﮷ ",
    cwd = "~/notes/",
    depth = 2,
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

function notes_grep()
  local opts = {}
  opts.hidden = true
  -- opts.file_ignore_patterns = { 'thesaurus/'}
  opts.search_dirs = {
    "~/notes/",
  }
  opts.prompt_prefix = "   "
  opts.prompt_title = " Grep Notes"
  opts.path_display = { "shorten" }
  require("telescope.builtin").live_grep(opts)
end
EOF

" -- Telescope keybindings
" Use custom function to search git_files first then find_files
nnoremap <leader>f <cmd>lua project_files()<cr>
nnoremap <leader>F <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>l <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>L <cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>
" Search for selected text in visual mode
vnoremap <leader>g "zy:Telescope live_grep default_text=<C-r>z<cr>
" Search with fuzzy find in cwd - optionally filtered first by a string
nnoremap <leader>g <cmd>lua require 'telescope.builtin'.grep_string({disable_coordinates = true, only_sort_text = true, search = vim.fn.input("Grep For > ") })<cr>
" nnoremap <C-g> <cmd>lua require 'telescope.builtin'.grep_string({disable_coordinates = true, only_sort_text = true, search = vim.fn.input("Grep For > "), cwd = vim.fn.expand('%:p:h') })<cr>
" nnoremap <leader>g <cmd>lua require 'telescope.builtin'.grep_string({ path_display = {"shorten"}, disable_coordinates = true, only_sort_text = true, search = '' })<cr>
" 2 stage search, first filter with ripgrep and then fuzzy find in matches
" nnoremap <leader>G <cmd>lua require 'telescope.builtin'.grep_string({ search = vim.fn.input("Grep For > ")})<cr>
" Regular grep - no fuzzy find (but fast?)
" nnoremap <leader>G <cmd>lua require('telescope.builtin').live_grep()<cr>
" Regular grep passing whole prompt to search engine (allows for rg filters like: -tphp)
nnoremap <leader>G <cmd>lua require('telescope').extensions.live_grep_raw.live_grep_raw()<cr>
" Grep token under cursor and search for it
" nnoremap <leader>gs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>B <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>P <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap <leader>p <cmd>lua require('telescope').extensions.neoclip.default()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>j <cmd>lua require('telescope.builtin').jumplist()<cr>
nnoremap <leader>n <cmd>lua notes_browse()<cr>
nnoremap <leader>ng <cmd>lua notes_grep()<cr>



"   Neoterm settings
" --------------------
let g:neoterm_autoinsert = 1                    " Autostart new terminal in insert mode
let g:neoterm_default_mod = 'vertical botright' " Set default terminal location


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
" nnoremap <leader>b  <Cmd>FzfBuffers<CR>
" nnoremap <leader>f  <Cmd>FzfFiles<CR>
" nnoremap <leader>l  <Cmd>FzfLinesWithPreview<CR>
" nnoremap <leader>L  <Cmd>FzfLines<CR>
" nnoremap <leader>g  <Cmd>FzfRg<CR>
" nnoremap <leader>G  <Cmd>RG<CR>
" nnoremap <leader>G! <Cmd>RG!<CR>
" vnoremap <leader>g  :call RgWithGivenRange()<CR>
"" xnoremap <leader>g  "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"

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
"" let g:fzf_preview_use_dev_icons = 1             " Use vim-devicons
"" let g:fzf_preview_use_floating_window = 0       " Use floating window
" let g:fzf_preview_floating_window_winblend = 5
" let g:fzf_preview_floating_window_rate = 0.95   " floating window size ratio
" let g:fzf_preview_if_binary_command = "test (file -b --mime-encoding {}) = 'binary'"  " g:fzf_binary_preview_command is executed if this command succeeds, and g:fzf_preview_command is executed if it fails
" let g:fzf_preview_lines_command = "bat --color=always --plain"
" let g:fzf_preview_fzf_preview_window_option = "down:20"
" let g:fzf_preview_fzf_color_option = "fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C,pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B"
" let g:fzf_preview_preview_key_bindings = "ctrl-d:preview-down,ctrl-u:preview-up,ctrl-p:toggle-preview,ctrl-w:toggle-preview-wrap,ctrl-l:accept,ctrl-h:clear-query"

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


"   Startify settings
" --------------------
let g:startify_session_persistence = 1 " Autosave sessions on exit when leaving vim and loading a new session
let g:startify_update_oldfiles = 0     " Update v:oldfiles on-the-fly
" let g:startify_relative_path = 1     " Show files with or without relativ path
let g:startify_change_to_dir = 0       " Don't change to files dir when opening
let g:startify_change_to_vcs_root = 1  " Change to VCS dir if there is one (git & hg)
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
            \ {'cf': '~/.dotfiles/fish/config.fish'},
            \ {'ci': '~/.dotfiles/init.vim'},
            \ {'ch': '~/.dotfiles/hammerspoon/init.lua'},
            \ {'cs': '~/.dotfiles/surfingkeys.js'},
            \ {'ck': '~/.dotfiles/kitty.conf'}
            \ ]
" How many files to display in the files & dir lists
let g:startify_files_number = 5


" ### Tree explorers

"   Vim Vaffle settings & keys
" -----------------------------
" let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

" -- Keys
map <leader>E <Cmd>Vaffle<CR>
map <leader>e <Cmd>Vaffle %<CR>
function! s:customize_vaffle_mappings() abort
    " Customize key mappings here
    " nmap  <buffer> <Bslash> <Plug>(vaffle-open-root)
    nmap  <buffer> cd       <Plug>(vaffle-chdir-here)
    " nmap  <buffer> J        <Plug>(vaffle-toggle-current)
    nmap  <buffer> <Tab>    <Plug>(vaffle-toggle-current)
    nmap  <buffer> <S-Tab>  <Plug>(vaffle-toggle-current)kk
    " nmap  <buffer> <Esc>    <Plug>(vaffle-quit)
    unmap <buffer> <Space>
endfunction
augroup vimrc_vaffle
    autocmd!
    autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END


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
" let g:vdebug_keymap = {
" \    "run_to_cursor" : "<Leader><Left>",
" \    "step_over" : "<Leader><Down>",
" \    "step_into" : "<Leader><Right>",
" \    "step_out" : "<Leader><Up>",
" \    "get_context" : "<Leader>c"
" \}


"   Vim Rooter settings
" ----------------------
let g:rooter_manual_only = 1


"   Gitgutter settings
" ----------------------
" let g:gitgutter_override_sign_column_highlight = 0  " Don't override default bg color
highlight GitGutterAdd    guifg=#009900 guibg=0 ctermfg=2 ctermbg=0
highlight GitGutterChange guifg=#bbbb00 guibg=0 ctermfg=3 ctermbg=0
highlight GitGutterChangeDelete guifg=#ee80ee guibg=0 ctermfg=4 ctermbg=0
highlight GitGutterDelete guifg=#ff2222 guibg=0 ctermfg=1 ctermbg=0


"   Fugitive settings
" ---------------------
" nmap <leader>Gs :Gstatus<CR><C-w>5+
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


"   CMP (& Tabnine) settings
" ----------------------------------
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<C-l>'] = cmp.mapping.confirm({ select = true }),
      ['<C-e>'] = cmp.mapping.close(),
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'cmp_tabnine' },
        { name = 'buffer' },
        { name = 'path' },
    })
  })

  local tabnine = require('cmp_tabnine.config')
    tabnine:setup({
    max_lines = 1000;
    max_num_results = 20;
    sort = true;
    run_on_every_keystroke = true;
    snippet_placeholder = '..';
  })
EOF


" ### Visual improvements


"   Smoothie settings
" ---------------------
let g:smoothie_update_interval = 5
let g:smoothie_base_speed = 5




" ------------------------------------------------------------------------------
"   Abbreviations
" ------------------------------------------------------------------------------

iabbrev clog; console.log();<Left><Left><Space><Left>
iabbrev dbg; debugger;
iabbrev vd; var_dump();<Left><Left><Space><Left>




" ------------------------------------------------------------------------------
"   Functions
" ------------------------------------------------------------------------------

" Wipe all registers with :WipeReg then save with :wshada! before restart neovim
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

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
