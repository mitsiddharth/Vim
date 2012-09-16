" Wrap too long lines
set wrap

" Tabs are 2 characters
set tabstop=2

" (Auto)indent uses 2 characters
set shiftwidth=2

" spaces instead of tabs
set expandtab

" guess indentation
set autoindent

" Expand the command line using tab
set wildchar=<Tab>

" enable all features
set nocompatible

" powerful backspaces
set backspace=indent,eol,start

" highlight the searchterms
set hlsearch

" jump to the matches while typing
set incsearch

" ignore case while searching
set ignorecase

" don't wrap words
set textwidth=0

" history
set history=50

" 1000 undo levels
set undolevels=1000

" show a ruler
set ruler

" show partial commands
set showcmd

" show matching braces
set showmatch

" write before hiding a buffer
set autowrite

" allows hidden buffers to stay unsaved, but we do not want this, so comment
" it out:
"set hidden

"set wmh=0

" auto-detect the filetype
filetype plugin indent on

" syntax highlight
syntax on

" Always show the menu, insert longest match
set completeopt=menuone,longest
" After using the underlined function, the tab is much more smart
" TAB will be used to complete while typing words, else it will insert usual
	" tab.
function! TabOrComplete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
	return "\<C-N>"
	else
	return "\<Tab>"
	endfunction" After using the underlined function, the tab is much more smart
	inoremap <Tab> <C-R>=TabOrComplete()<CR>


	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

	" Show mouse in
	set mouse=nvi

	" Use g++ as the compiler
	set makeprg=g++\ %

	iab #i #include
	iab #d #define
	iab _u using namespace std
	iab _main_ int main()<cr>{<cr><Home><Tab>return 0;<cr>}<cr><Up><Up>

	" Go to the next tab
	map <C-Right> <Esc>:tabnext<cr>
	" Go to the previous tab
	map <C-Left> <Esc>:tabprevious<cr>
	" Open a new tab
	" map <C-T> <Esc>:tabnew<cr>
	" Comment out all cout statements
	map <F3> <Esc>:1,$s/cout/\/\/cout/g<cr><Esc>:1,$s/getchar()/\/\/getchar/g<cr>
	" Press F4 for auto-complete
	imap <F4> <C-P>
	" Ctrl Z for undo
	imap <C-Z> <Esc>:u<cr><Esc>i
	" Compile
	map <F9> :!clear<cr>:!echo "Compiling "%<cr>:mak<CR>
	" Show next compile error
	map <F8> :cn<CR>
	" Show previous compile error
	map <F7> :cp<CR>
	" Run the program
	map <C-F9> :!clear<cr>:!echo "Running "%<cr>:!./a.out<CR>
