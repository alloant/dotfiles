" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'


" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" lf integration
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
"Plug 'rakr/vim-one'
Plug 'bluz71/vim-moonfly-statusline'
Plug 'https://github.com/yuttie/comfortable-motion.vim.git'
Plug 'https://github.com/fisadev/FixedTaskList.vim.git'
Plug 'https://github.com/vim-ctrlspace/vim-ctrlspace.git'
Plug 'https://github.com/majutsushi/tagbar.git'
"Plug 'https://github.com/ayu-theme/ayu-vim'
Plug 'https://github.com/cocopon/iceberg.vim.git'
Plug 'https://github.com/universal-ctags/ctags.git'
" Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" let g:NERDTreeUpdateOnCursorHold = 0
" let g:NERDTreeUpdateOnWrite      = 0
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'habamax/vim-asciidoctor'
Plug 'marioortizmanero/adoc-pdf-live.nvim'

" Plug 'sbdchd/vim-run'

" Initialize plugin system
call plug#end()
colorscheme iceberg
"set background=dark

" spell languages
set spelllang=en,es


" for control space
set nocompatible
set hidden
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
"hi link CtrlSpaceSearch IncSearch
"hi link CtrlSpaceNormal   PMenu
"hi link CtrlSpaceSelected PMenuSel
"hi link CtrlSpaceSearch   Search
"hi link CtrlSpaceStatus   StatusLine
hi CtrlSpaceSearch guifg=#FFFFFF guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
hi CtrlSpaceNormal guifg=#FFFFFF guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
hi CtrlSpaceSelected guifg=#FFFFFF guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
hi CtrlSpaceStatus guifg=#FFFFFF guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
"set showtabline=0
if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

if has('win32')
    let s:vimfiles = '~/vimfiles'
    let s:os   = 'windows'
else
    let s:vimfiles = '~/.vim'
    if has('mac') || has('gui_macvim')
        let s:os = 'darwin'
    else
    " elseif has('gui_gtk2') || has('gui_gtk3')
        let s:os = 'linux'
    endif
endif

let g:CtrlSpaceFileEngine = s:vimfiles . '/plugged/vim-ctrlspace' . '/bin/file_engine_' . s:os . '_amd64'

" pandoc
" let g:pandoc_citation_style = 'apa-6th-edition.csl'
" let g:pandoc_reference_docx = 'reference.docx'
" let g:pandoc_output_dir = './'
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0


" trigger markdown.pandoc syntax on all markdown files
autocmd BufEnter *.md,*.mkd setlocal filetype=markdown.pandoc


" asciidoc

" What to use for HTML, default `asciidoctor`.
let g:asciidoctor_executable = 'asciidoctor'

" What extensions to use for HTML, default `[]`.
let g:asciidoctor_extensions = ['asciidoctor-diagram', 'asciidoctor-rouge']

" Path to the custom css
let g:asciidoctor_css_path = '~/docs/AsciiDocThemes'

" Custom css name to use instead of built-in
let g:asciidoctor_css = 'haba-asciidoctor.css'


" What to use for PDF, default `asciidoctor-pdf`.
let g:asciidoctor_pdf_executable = 'asciidoctor-pdf'

" What extensions to use for PDF, default `[]`.
let g:asciidoctor_pdf_extensions = ['asciidoctor-diagram']

" Path to PDF themes, default `''`.
let g:asciidoctor_pdf_themes_path = '~/docs/AsciiDocThemes'

" Path to PDF fonts, default `''`.
let g:asciidoctor_pdf_fonts_path = '~/docs/AsciiDocThemes/fonts'


" What to use for DOCX, default `pandoc`.
" The DOCX 'compilation' process is to generate `docbook` using
" `g:asciidoctor_executable` and then to generate DOCX out of `docbook`
" using `pandoc`.
let g:asciidoctor_pandoc_executable = 'pandoc'

"" --data-dir
let g:asciidoctor_pandoc_data_dir = '~/docs/.pandoc'

" Other parameters you want to feed pandoc
let g:asciidoctor_pandoc_other_params = '--toc'

" Reference document to reuse styles
" If not set up asciidoctor looks for the theme name
" :pdf-style: mytheme
" in the first 30 lines and generate reference-doc filename:
" g:asciidoctor_pandoc_data_dir + mytheme + '-reference.docx'
" for example: ~/docs/.pandoc/mytheme-reference.docx
let g:asciidoctor_pandoc_reference_doc = 'custom-reference.docx'


" Fold sections, default `0`.
let g:asciidoctor_folding = 1

" Fold options, default `0`.
let g:asciidoctor_fold_options = 1


" Conceal *bold*, _italic_, `code` and urls in lists and paragraphs, default `0`.
" See limitations in end of the README
let g:asciidoctor_syntax_conceal = 1

" Highlight indented text, default `1`.
let g:asciidoctor_syntax_indented = 0

" List of filetypes to highlight, default `[]`
let g:asciidoctor_fenced_languages = ['python', 'c', 'javascript']


" Function to create buffer local mappings and add default compiler
fun! AsciidoctorMappings()
    nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
    nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
    nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
    nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
    nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
    nnoremap <buffer> <leader>cp :Asciidoctor2PDF<CR>
    nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
    nnoremap <buffer> <leader>p :AsciidoctorPasteImage<CR>
    " :make will build pdfs
    compiler asciidoctor2pdf
endfun

" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
    au!
    au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END
" end asciidoc

lua <<EOF
require('adoc_pdf_live').setup {
    enabled = false,
    -- The viewer command must be like `command <file>`
    viewer = 'zathura',
    binary = 'asciidoctor-pdf',
    params = '',
    debug = false,
    style = '',
    style_regex = 'style\\.ya?ml'
}
EOF

let s:adoc_pdf_live = luaeval('require("adoc_pdf_live")')

if s:adoc_pdf_live.is_configured()
    " Start/stop the live preview
    command! AdocPdfLiveStart :call s:adoc_pdf_live.start()
    command! AdocPdfLiveStop :call s:adoc_pdf_live.stop()
    " Start the live preview and open the file
    command! AdocPdfLiveOpen :call s:adoc_pdf_live.open()

    " Set debug mode
    command! AdocPdfLiveDebug :call s:adoc_pdf_live.set_debug(1)
    command! AdocPdfLiveNoDebug :call s:adoc_pdf_live.set_debug(1)
    " Set the style file
    command! -nargs=1 AdocPdfLiveStyle :call s:adoc_pdf_live.set_style('<args>')

    " Show the logs
    command! AdocPdfLiveLogs :call s:adoc_pdf_live.show_logs()

    " Compile on save
    augroup asciidocpdf_live
        autocmd!
        autocmd BufWritePost *.adoc :call s:adoc_pdf_live.compile(1)
    augroup END
endif



" others
set clipboard=unnamedplus
set nu

set guifont=Dejavu\ Sans\ Mono:h12
let g:python3_host_prog = '/usr/bin/python'
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" set linespace=4

map <C-n> :NERDTreeToggle<CR>
" map <C-Down> <C-W>j
" map <C-Up> <C-W>k
" map <C-Left> <C-W>h
" map <C-Right> <C-W>l

" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Noto Sans Mono:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a


nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>
