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

" Set filetype
augroup filetypedetect
    au! BufRead,BufNewFile *.sp		setfiletype sporth
augroup END
