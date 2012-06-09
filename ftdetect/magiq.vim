function! s:DetectMagiQ()
  if getline(1) =~ '^\*DYOFF\*'
    set filetype=magiq
  endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectMagiQ()
