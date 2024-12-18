
""""""""""""" General ViM Settings """""""""
scriptencoding utf-8
syntax on
filetype indent plugin on
set hidden
set encoding=utf-8  " Use utf-8 encoding
set incsearch       " move while searching
set laststatus=2    " always show the status line
set report=0        " tell us when anything is changed via :...
set scrolloff=10    " Keep 10 lines (top/bottom) for scope
set showcmd         " show the command being typed
set showmatch       " show matching brackets
set backspace=indent,eol,start
set shiftwidth=4
set tabstop=4
set softtabstop=4 noexpandtab
" set expandtab                   " Tabs insert 4 space characters
set virtualedit+=block            " Allow the cursor to go anywhere in visual block mode
set relativenumber                " Relative line numbers
set number                        " Line numbers [:set number!] to turn off
set numberwidth=5                 " We are good up to 99999 lines
set sidescrolloff=10              " Keep 5 lines at the size
set list                          " Show whitespace and tabs
set listchars=tab:\¦·,trail:·     " show tabs and trailing whitespace
set clipboard=unnamed             " copy and paste with *
set mouse=a                       " Scrollable term-vim
autocmd BufWritePre * %s/\s\+$//e " trim trailing whitespace
set nohlsearch    " highlight removed until next search
set splitright    " Preview window opens to the right, not above
set shortmess=aFc " remove prompts to continue messages in cmd line
set completeopt=preview,menu
""""""""""""" END General ViM Settings """""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""" Plug configs """""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
" ctrlp root directories
let g:ctrlp_root_markers = ['index.ios.tsx', 'webpack.*config.js', 'README.md', 'package.json']
let g:ctrlp_custom_ignore = '\v[\/](node_modules|jspm_packages|__coverage__|target|manifest.json|build)|(\.(swp|ico|git|svn|lock|svg|png|jp[e]?g))$'
let g:ctrlp_max_files = 0
" default open in new tabs, instead of buffer
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': [],
\ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
\ }
" Autoread file changes.
Plug 'djoshea/vim-autoread'

" Colorschemes
Plug 'joshdick/onedark.vim'
Plug 'roosta/vim-srcery'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'rakr/vim-two-firewatch'
Plug 'Wutzara/vim-materialtheme'


" """""""""""" Autocompletion """"""""""""""""""""""""""""""""
"
nmap <silent> td <Plug>(coc-definition)
nmap <silent> tt <Plug>(coc-type-definition)
nmap <silent> ti <Plug>(coc-implementation)
nmap <silent> tr <Plug>(coc-references)
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent> H :call CocActionAsync('highlight')<CR>
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <C-c> :CocEnable<CR>
nmap <C-x> :CocDisable<CR>

" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
" ONLY FOR typescript until neoclide preview window is working better
Plug 'w0rp/ale'
let g:ale_sign_error = '>'
let g:ale_sign_warning = '!'
let g:ale_lint_delay = 200
let b:ale_linters = ['tslint']
let g:ale_linters = {'jsx': ['tslint']}
let g:ale_linters = {'rust': []}
" Disable lint for rust, use Neoclide coc-rls
let g:ale_sign_column_always = 1 "" annoying if it's not kept open
" Default: 200ms
nmap <C-z> :ALEDetail<CR>

"""""""""""""""" Syntax highlighting
"" Rust
Plug 'rust-lang/rust.vim'

""" solidity
Plug 'tomlion/vim-solidity'
Plug 'iden3/vim-circom-syntax'

""" Python
Plug 'davidhalter/jedi-vim'

"" Docker
Plug 'ekalinin/Dockerfile.vim'

"" Go
Plug 'fatih/vim-go'
let g:go_fmt_autosave=0

"""" CSS syntax highlight
Plug 'othree/csscomplete.vim'
" Add Support css3 properties
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
" highlight hex colors in color
au BufRead,BufNewFile *.scss set filetype=scss.css
au BufRead,BufNewFile *.sass set filetype=sass.css

""""""" Javascript
" Syntax highlighting for .jsx (typescript)
Plug 'peitalin/vim-jsx-typescript'
"" Typescript "
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0
" GraphQL syntax highlighting
Plug 'jparise/vim-graphql'

""""""" Brackets & Parentheses highlighting
" Allow autoclose paired characters like [,] or (,),
Plug 'jiangmiao/auto-pairs'
" Highlights the matching HTML tag when the cursor is positioned on a tag.

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" PLUGS MUST BE ABOVE THIS LINE """""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""" Toggle Fold Columns
set foldmethod=indent
set foldnestmax=1
" nnoremap <C-c> :%foldc<CR>
set foldlevelstart=10
if line("$") > 400
    set foldlevel=3
endif

let g:tagbar_type_markdown = {
\ 'ctagstype': 'markdown',
\ 'kinds': ['h:Heading_L1', 'i:Heading_L2', 'k:Heading_L3']
\ }

nnoremap <silent> <F11> :TagbarToggle<CR>


""""""""""""""""""" VIM JEDI PYTHON """"""""""""""
let g:jedi#completions_enabled = 1
let g:jedi#show_call_signatures = 0
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
au FileType python setlocal completeopt-=preview " The reason to deactivate jedi#auto_vim_configuration
" popup function documentation window, preview -> popup



""""""""""""" Custom key bindings """"""""""
"""NEVER MAP TO: <C-[> , causes mouse scrolling bug
" http://stackoverflow.com/questions/21738018/vim-how-do-i-map-number-keys

let mapleader = "\<Space>"
"" save file nnoremap <Leader>w :wa<CR>

:imap kj <ESC>
noremap ;; :
inoremap ;; <Esc>:

inoremap <C-f> <right>
inoremap <C-b> <left>

" replace tabs with 4 whitespacu
" nmap <F4> :%s/\t/    /g<CR>
nmap <Leader>s :%s/\t/    /g<CR>
autocmd FileType typescript.tsx,javascript.tsx,javascript,typescript nmap <Leader>s :%s/\t/  /g<CR>

" au BufNewFile,BufRead *.js *.html nmap <Leader>s :%s/\t/  /g<CR>
autocmd FileType python,rust,haskell,markdown setlocal shiftwidth=4 tabstop=4
autocmd FileType yaml,typescript.tsx,javascript.tsx,javascript,typescript setlocal shiftwidth=2 tabstop=2 softtabstop=4 noexpandtab
set softtabstop=4 noexpandtab
" au BufNewFile,BufRead *.hbs setlocal ft=d
" autocmd BufNewFile,BufRead *.ts,*.js set filetype=typescript.tsx
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.zn set filetype=rust
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.vue set filetype=vue.typescript
autocmd FileType vue.typescript setlocal commentstring=//\ %s
autocmd FileType typescript setlocal commentstring=//\ %s
autocmd FileType json setlocal commentstring=//\ %s
" autocmd FileType *.jsx,*.tsx setlocal commentstring=//\ %s
autocmd FileType json syntax match Comment +\/\/.\+$+

" Ctrl-P refresh file cache
nmap C :CtrlPClearCache<cr>

""""""""""" Nerdtree Config
map <C-t> :NERDTreeToggle<CR>

""  buffers
" nmap gt :bnext<CR>
" nmap tg :bprevious<CR>
nmap bd :bdelete<CR>
nmap <Leader>b :buffers<CR>
nmap tg :tabprevious<CR>

"" Refresh file state
map <leader>r :e! <CR>
nmap <leader>w :wa<CR>

""""""""""" Gundo Tree Toggle
map <C-u> :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

""""""""""" window navigation
nmap <silent> <S-up> :wincmd k<CR>
nmap <silent> <S-down> :wincmd j<CR>
nmap <silent> <S-left> :wincmd h<CR>
nmap <silent> <S-right> :wincmd l<CR>

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

""""""""""" clipboard copy and cut
vmap <C-x> :!pbcopy<CR>
" yanks and copies to system clipboard
vnoremap <C-c> "*y
vnoremap y "*y
vnoremap <C-v> "+p
vnoremap p "*p

""""""""" Tab indent
vnoremap <TAB> >
vnoremap <S-TAB> <
nnoremap <TAB> V >
nnoremap <S-TAB> V <

"""""" disable annoying lowercase shortcut in visual-mode
vnoremap u <Nop>

""""""""""" EmacS bol/eol
noremap <C-a> ^
noremap <C-e> $
inoremap <C-a> <ESC> ^i
inoremap <C-e> <ESC> $i

""""""""" Insert mode
imap <C-f> <Right>
imap <C-b> <Left>

""""""""" Vim Signature
nmap <leader>m '?

"""""""" Multiple Cursors
nmap <leader>n <C-N>

""""""" Tagbar Overview Map
map <leader>c :TagbarToggle<CR>

""""""" easymotion
" Replace default search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" easymotion with hjkl keys
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

"""""""""" Add newline in normal mode with shift+enter
" Quickly insert an empty new line without entering insert mode
nnoremap L i<CR><Esc>
" nnoremap <Leader>o i<CR><Esc>
" nnoremap <Leader>O i<CR><Esc>


"""""""" Vim lightline  """

let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'mode_map': { 'c': 'NORMAL' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'modified': 'LightlineModified',
    \   'readonly': 'LightlineReadonly',
    \   'filename': 'LightlineFilename',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \   'fileencoding': 'LightlineFileencoding',
    \   'mode': 'LightlineMode',
    \ },
    \ }
    " \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    " \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }

" let g:lightline.separator = {
"     \   'left': '▶', 'right': '◀'
"   \}
" let g:lightline.subseparator = {
"     \   'left': '▶', 'right': '◀'
"   \}

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '♤ ' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != expand('%:f') ? expand('%:f') : '[New File]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

" NORMAL / INSERT / VISUAL
function! LightlineMode()
  return winwidth(0) > 40 ? lightline#mode() : ''
endfunction

" javascript.jsx
function! LightlineFiletype()
  return winwidth(0) > 100 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" utf-8
function! LightlineFileencoding()
  return winwidth(0) > 80 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

" unix
function! LightlineFileformat()
  return winwidth(0) > 120 ? &fileformat : ''
endfunction

let g:lightline.enable = {
\   'tabline': 1
\ }

function! ResizeCmdHeight()
  if &columns < 90
    set cmdheight=2
  else
    set cmdheight=1
  endif
endfunction

augroup ResizeCmdOnVimResized
    autocmd!
    autocmd VimResized * call ResizeCmdHeight()
augroup END


""""""" Vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
autocmd FileType python,rust let g:indent_guides_guide_size = 1
autocmd FileType yaml,typescript.tsx,javascript.jsx,javascript,typescript let g:indent_guides_guide_size = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_tab_guides = 1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#243e48 ctermbg=237
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#283e48 ctermbg=236


""""""""""""" Color Schemes """"""""""""""""
set termguicolors
colorscheme onedark
" colorscheme japanesque
" colorscheme srcery
" colorscheme materialtheme
" autocmd FileType rust colorscheme srcery
" autocmd FileType python colorscheme onedark

" Normal         xxx ctermfg=145 ctermbg=235 guifg=#ABB2BF guibg=#282C34
highlight Normal guibg=#202328
highlight MatchParen guifg=#C678DD guibg=#504066
highlight LineNr    guifg=#151822
highlight CursorLineNr guifg=#56B6C2
highlight Error guifg=#f57373 guibg=#804040
highlight vimError guifg=#f57373 guibg=#804040

hi IndentGuidesEven guibg=#2a2e30 guifg=#24282a
hi IndentGuidesOdd guibg=#262a2c guifg=#24282a
hi Comment cterm=italic guifg=#4a5158
hi String guifg=#98C379 guibg=#2a2e34

""" browns
" function params: numbers and constants
" hi Keyword guifg=#907161
" hi Statement guifg=#56B6C2
" hi Conditional guifg=#56B6C2

" Yellows
hi Number guifg=#E5C07B
hi Special guifg=#E5C07B
hi Boolean guifg=#E5C07B
hi Type guifg=#F0A15F
" #D19A66

" purple
hi CtrlPMatch guifg=#ba9ef7
hi Visual guibg=#364652
hi Keyword guifg=#ba9ef7
hi Function guifg=#5682A3

" dark grey, RUST preproc
hi Preproc guifg=#37505C

""" Pink
"""""" vim-jsx ONLY
hi Identifier guifg=#D96Ab2
" hi Identifier cterm=italic guifg=#D96Ab2
" hi Statement guifg=#D96AB2
hi Conditional guifg=#D96AB2

""" Go and Python
" Light blue
autocmd FileType python,go highlight Keyword guifg=#59ACE5
autocmd FileType python,go highlight goDeclaration guifg=#59ACE5
" Dark blue
autocmd FileType python,go highlight Function guifg=#2974a1
autocmd FileType python,go highlight goConditional guifg=#2974a1
" cyan
autocmd FileType python,go highlight goStatement guifg=#56B6C2
autocmd FileType python,go highlight goRepeat guifg=#56B6C2


" " dark red
" hi tsxTagName guifg=#E06C75
" " orange
" hi tsxCloseString guifg=#F99575
" hi tsxCloseTag guifg=#F99575
" hi tsxAttributeBraces guifg=#F99575
" hi tsxEqual guifg=#F99575
" " yellow
" hi tsxAttrib guifg=#F8BD7F cterm=italic

" light blue
hi tsxTagName guifg=#59ACE5
hi tsxComponentName guifg=#59ACE5
" dark blue
hi tsxCloseString guifg=#2974a1
hi tsxCloseTag guifg=#2974a1
hi tsxAttributeBraces guifg=#2974a1
hi tsxEqual guifg=#2974a1
hi tsxCloseTagName guifg=#2974a1
hi tsxCloseComponentName guifg=#2974a1
" green
hi tsxAttrib guifg=#1BD1C1


" cyan
hi Constant guifg=#56B6C2
hi typescriptBraces guifg=#56B6C2
hi typescriptEndColons guifg=#56B6C2
hi typescriptRef guifg=#56B6C2
hi typescriptPropietaryMethods guifg=#56B6C2
hi typescriptEventListenerMethods guifg=#56B6C2
hi typescriptFunction guifg=#56B6C2
hi typescriptVars guifg=#56B6C2
hi typescriptParen guifg=#56B6C2
hi typescriptDotNotation guifg=#56B6C2
hi typescriptBracket guifg=#56B6C2
hi typescriptBlock guifg=#56B6C2
hi typescriptJFunctions guifg=#56B6C2
hi typescriptSFunctions guifg=#56B6C2
hi typescriptInterpolationDelimiter guifg=#56B6C2
hi typescriptExceptions guifg=#DDA671
" hi typescriptIdentifier guifg=#907161
" hi typescriptStorageClass guifg=#907161
hi typescriptIdentifier guifg=#65809D
hi typescriptStorageClass guifg=#65809D
" JSON
hi jsonCommentError cterm=italic guifg=#4a5158

" javascript
hi jsParens guifg=#56B6C2
hi jsObjectBraces guifg=#C678DD
hi jsFuncBraces guifg=#56B6C2
hi jsObjectFuncName guifg=#D19A66
hi jsObjectKey guifg=#56B6C2

" vim-jsx-typescript
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66


" JSX Dark Blue and Neon Green highlights
hi xmlEndTag guifg=#2974a1
" hi tsxCloseString guifg=#2974a1
hi tsxCloseString guifg=#15608f
hi htmlTag guifg=#2974a1
hi htmlEndTag guifg=#2974a1
hi htmlTagName guifg=#59ACE5
hi tsxAttrib guifg=#1BD1C1

hi tsxTypeBraces guifg=#BDA7CC
hi tsxTypes guifg=#8D779C
hi tsxIfOperator guifg=#56B6C2
hi tsxElseOperator guifg=#56B6C2


" rust cyan
hi rustModPath guifg=#DF997A
hi rustFuncCall guifg=#60A0D0
hi rustFuncName guifg=#60A0D0
hi rustTrait guifg=#C898C8
hi rustCommentLine guifg=#aaaaaa guifg=#444444


hi rustFoldBraces guifg=#FFEAD0
hi rustBoxPlacementBalance guifg=#C898C8

hi ALEError      guibg=#612E2D cterm=italic
hi ALEWarning    guibg=#523D30 cterm=italic
" Coc linting colors
hi CocErrorHighlight   guibg=#612E2D cterm=italic
hi CocWarningHighlight guibg=#523D30 cterm=italic
hi CocHighlightText    guibg=#40334A

hi CocInfoHighlight    guibg=#A5BFD5 cterm=italic
hi CocHintHighlight    guibg=#A5BFD5 cterm=italic

hi CocErrorSign   guifg=#CD584F
hi CocWarningSign guifg=#D3785D



" Identify the syntax highlighting group used at the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

