" Vim global plugin for capturing the current b:partial_word
" Maintainer:	Barry Arthur <barry.arthur@gmail.com>
" Version:	0.1
" Description:	Stores the current partial word in insert mode into b:partial_word
" Last Change:	2014-03-28
" License:	Vim License (see :help license)
" Location:	plugin/vimpartial.vim
" Website:	https://github.com/dahu/vimpartial
"
" See vimpartial.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help vimpartial

" Vimscript Setup: {{{1
" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development.
" XXX The conditions are only as examples of how to use them. Change them as
" needed. XXX
"if exists("g:loaded_vimpartial")
"      \ || v:version < 700
"      \ || v:version == 703 && !has('patch338')
"      \ || &compatible
"  let &cpo = s:save_cpo
"  finish
"endif
"let g:loaded_vimpartial = 1

" Private Functions: {{{1
function! CurrentPartialWord()
  let p = searchpos('\W\zs\w\+\%#', 'bnW')
  let b:partial_word = strpart(getline('.'), p[1]-1, col('.')-p[1])
endfunction

autocmd CursorMovedI * call CurrentPartialWord()

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo

" Template From: https://github.com/dahu/Area-41/
" vim: set sw=2 sts=2 et fdm=marker:
