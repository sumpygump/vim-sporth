" ============================================================================
" File:        sporth.vim
" Description: Vim plugin for Sporth features and syntax
" Maintainer:  Jansen Price <jansen.price at gmail dot com>
" Last Change: 2019-12-16
" License:     http://www.opensource.org/licenses/mit-license.php MIT
" Usage:       Run a sporth server and then use this plugin to execute
"              sp_eval_file and spparse quickly within vim
" ============================================================================
let s:Version = '0.9'

if exists('g:loaded_sporth')
  finish
endif
let g:loaded_sporth = 1

" For when running a sporth server
" e.g. `sporth -b jack -0`

" Main functions
" =========================================
function! s:SporthEvalFile() abort
    silent exec "!sp_eval_file %"
    redraw!
endfunction
command! SporthEvalFile call s:SporthEvalFile()

function! s:SporthQuiet() abort
    silent exec "!echo 0 \| spparse 6449"
    redraw!
endfunction
command! SporthQuiet call s:SporthQuiet()

function! s:SporthAutoEval() abort
    let g:sporth_eval_on_write = 1
    au! BufWrite *.sp SporthEvalFile
endfunction
command! SporthAutoEval call s:SporthAutoEval()

" Function to launch the help buffer
function! s:SporthUgenLookup(word) abort
    if s:getSporthHelpWinNum() != -1
        exec bufwinnr(t:SporthHelpBuf) . "wincmd w"
    else
        " Split up to a window with n height
        5 new
        exec s:CreateHelpWin()
    endif

    call s:DoUgenLookup(a:word)
    wincmd j
endfunction
command! -nargs=1 SporthHelp call s:SporthUgenLookup(<q-args>)

function! SporthUgenLookupCurrent() abort
    let wordUnderCursor = expand("<cword>")
    echom wordUnderCursor
    call <sid>SporthUgenLookup(wordUnderCursor)
endfunction

" Fetch the results from ugen_lookup
function! s:DoUgenLookup(word) abort
    silent execute "%!ugen_lookup" shellescape(a:word)
    if v:shell_error == '1'
        normal! G
        exec "normal! oReturn code:" . v:shell_error
    endif
    normal! 1G
endfunction

" Create the help window
function! s:CreateHelpWin() abort
    let t:SporthHelpBufName = "__sporth_help__"

    exec "edit " . t:SporthHelpBufName

    " Set up as a throw away buffer
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal nonumber
    set readonly

    " Store the buffer number of the resulting buffer
    let t:SporthHelpBuf = bufnr("")
endfunction

" Get the buffer number of the current help buffer (if exists)
function! s:getSporthHelpWinNum()
    if exists("t:SporthHelpBufName")
        return bufwinnr(t:SporthHelpBufName)
    else
        return -1
    endif
endfunction

" Keymapping
" =========================================
if !exists('g:sporth_map_keys')
    let g:sporth_map_keys = 1
endif

if g:sporth_map_keys
    " For evaluating the current file
    nnoremap <leader>[ :SporthEvalFile<CR>
    nnoremap <F8> :SporthEvalFile<CR>

    " For making the sound quiet
    nnoremap <leader>] :SporthQuiet<CR>
    nnoremap <F9> :SporthQuiet<CR>

    " For looking up the current word
    nnoremap <leader>h :call SporthUgenLookupCurrent()<CR>

    " Parse what is visually highlighted
    vnoremap <leader>[ !spparse 6449<CR>
endif

" Autoeval on write
" =========================================
if !exists('g:sporth_eval_on_write')
    let g:sporth_eval_on_write = 0
endif

if g:sporth_eval_on_write
    au! BufWrite *.sp SporthEvalFile
endif
