" focus_toggle - Add and remove focus from ruby tests
" Maintainer:   Jacques Visser <https://github.com/jcqvisser>
" Version:      0.1" 

if exists('g:focus_toggle')
  finish
else
  let g:focus_toggle = 'yes'
endif

" Add/Remove focus from all minitests in file
command! Af %s/  \( *\)\(\(scenario\)\|\(test\)\)/  \1focus\r  \1\2/g | w
command! Rf %s/   *focus\n//g | w

" Add/Remove focus from minitest around cursor
let s:test_words = ["test \"", "def test_\\w", "scenario\ \"", "test '"]
let s:decorator = "focus"
function! AddFocusHere()
  let l:view = winsaveview()
  let l:test_line = search('  \(' . join(s:test_words, '\)\|\(') . '\)', 'bn')
  let l:line_text = string(getbufline(bufnr('%'), l:test_line))

  let l:test_position = match(l:line_text, "\\(" . join(s:test_words, "\\)\\|\\(") . "\\)")
  let l:starting_whitespace = strpart(l:line_text, 2, l:test_position -2)
  echo l:starting_whitespace

  call append(l:test_line - 1, [l:starting_whitespace . s:decorator])
  call winrestview(l:view)
endfunction

function! RemoveFocusHere()
  let l:test_line = search('  \(' . join(s:test_words, '\)\|\(') . '\)', 'bn')
  let l:focus_line = search('^\s*' . s:decorator, 'bn')

  let l:view = winsaveview()
  if (l:focus_line == l:test_line - 1)
    exe l:focus_line .'d'
  endif
  call winrestview(l:view)
endfunction

command! AddFocusHere call AddFocusHere()
nnoremap <leader>af :AddFocusHere<CR>

command! RemoveFocusHere call RemoveFocusHere()
nnoremap <leader>rf :RemoveFocusHere<CR>

