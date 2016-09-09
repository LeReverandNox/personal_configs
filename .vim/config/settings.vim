"*** On surligne la ligne actuelle
set cursorline
" hi CursorLine term=bold cterm=bold

"*** On surligne les résultats de la recherche
set hlsearch

"*** On modifie les regles d'indentation
" On utilise des espaces au lieu des tabs
set expandtab
"Si on utilise des tabs, on le fait intelligement
set smarttab
" 1 tab = 4 espaces
set tabstop=4
set softtabstop=4
" 4 espaces pour l'indentation
set shiftwidth=4
set shiftround

"*** On insere automatiquement un début de commentaire à la ligne suivante, lors d'un commentaire...
set formatoptions+=tcr

"*** On active la souris
if has('mouse')
    set mouse=a
endif

"*** On affiche les coordonnées du curseur dans la status line
set ruler

"*** On affiche la commande en cours dans la status line
set showcmd

"*** On active la recherche incrémentale durant la saisie
set incsearch

"*** On active l'historique pour 100 commandes
set history=100

"*** On recopie l'identation de la ligne en cours lors d'une nouvelle ligne
set autoindent

"*** On active l'indentation auto par type de fichier
filetype plugin on
filetype indent on

"*** On active l'indentation intelligente pour le code
set smartindent

"*** On ignore la case lors de la recherche d'un pattern en minuscule
set ignorecase
set smartcase

"*** On numérote les lignes
set number

"*** On active la création d'un backup et d'un swap qu'on delocalise
set backup
set backupdir=~/.vim/temp_dirs/backups
set directory=~/.vim/temp_dirs/backups
set writebackup
set swapfile

"*** On affiche la status line en permanence
set laststatus=2

"*** On indique à Vim la couleur du background
set background=dark

"*** On active la coloration syntaxique
syntax on

"*** On définit le colorscheme
" colorscheme badwolf
" let g:solarized_termcolors=256
colorscheme solarized
hi Normal ctermbg=none

"*** On colore la 81eme colonne si on la depasse
hi ColorColumn ctermbg=39
call matchadd('ColorColumn', '\%81v', 100)

"*** On définit une largeur max de 80 pour les fichiers text
"autocmd FileType text setlocal textwidth=80

"=====[ Highlight matches when jumping to next ]=============
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

"=====[ Highlight the match in red ]=============
highlight WhiteOnPurple ctermbg=93 ctermfg=white
function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnPurple', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

"*** On affiche les trailing spaces, les tabs et les non-breaking spaces
" exec "set listchars=tab:,trail:\uB7,nbsp:~"
" exec "set listchars=tab:ᗙ-,trail:\uB7,nbsp:~"
exec "set listchars=tab:>-,trail:\uB7,nbsp:~"
set list
"*** Et on les colore en bleu
hi SpecialKey ctermfg=39
hi NonText ctermfg=39
" On map l'affichage des invisibles
nmap <leader>l :set list!<cr>

"*** On remap : sur ;
nnoremap ; :

"*** On active le mode diagraph quand on appuie sur C-K
inoremap <expr> <C-K> ShowDigraphs()
function! ShowDigraphs ()
    digraphs
    call getchar()
    return "\<C-K>"
endfunction

"*** On active l'UTF-8
set encoding=utf-8

" On configure le leader key
let mapleader = ","
let g:mapleader = ","

" On remet le leader key en pression simple
map <Leader> <Plug>(easymotion-prefix)

" On active le wildmenu pour la completion
set wildmenu

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" On remap 0 comme ^
map 0 ^

" On supprime automatiquement les trailing spaces lors de l'enregistrement
func! DeleteTrailingWS()
      exe "normal mz"
      %s/\s\+$//ge
      exe "normal `z"
endfunc
autocmd BufWrite *.* :call DeleteTrailingWS()

" On map le spell check FR/EN rapide
map <leader>ssf :set spelllang=fr spell!<cr>
map <leader>sse :set spelllang=en spell!<cr>

" On map NERDTree rapide
map <leader>ne :NERDTree<cr>

" On map le paste mode rapide
map <leader>pp :set paste!<cr>

" On map la desactivation du HL recherche
map <leader><space> :set hlsearch!<cr>

" On creer un bind pour select le contenu de la derniere insertion
nnoremap gV `[v`]

" On map l'ouverture de Gundo
nnoremap <leader>u :GundoToggle<cr>

" On map l'edition et le reload de .vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>:sp ~/.vim/config/settings.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<CR>

" On map l'ouveture/fermeture des folds sur space
map <space> za<cr>

" On affiche la foldcolumn
set foldcolumn=2

" On active le fold par indentation
set foldenable
set foldmethod=indent

" On ouvre les folds majeurs
set foldlevelstart=10

" On definit la profondeur de fold max
set foldnestmax=10

" Persistent undo
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

" On fait flasher le bracket couvrant correspondant
set showmatch
set mat=2

" Options pour CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
