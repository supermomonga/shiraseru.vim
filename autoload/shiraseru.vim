let s:save_cpo = &cpo
set cpo&vim


function! shiraseru#notify(...)
  " error check
  let l:argnum = a:0
  let l:error = ''
  let l:title = ''
  let l:optionargs = {}
  if l:argnum == 0
    let l:error = 'Error: No arg passed.'
  elseif l:argnum > 3
    let l:error = 'Error: Too much args passed.'
  elseif l:argnum == 1
    let l:message = a:000[0]
  elseif l:argnum == 2
    let l:title = a:000[0]
    let l:message = a:000[1]
  elseif l:argnum == 3
    let l:title = a:000[0]
    let l:message = a:000[1]
    let l:optionargs = a:000[2]
  endif
  if l:error != ''
    echo l:error
  else
    " Main routine
    let l:options = [
          \ g:shiraseru_growlnotify_path,
          \ '-m' , l:message
          \ ]
    if l:title != ''
      call add(l:options, '-t')
      call add(l:options, l:title)
    endif
    " options
    for k in keys(l:optionargs)
      if index(g:shiraseru_options, k) != -1
        let l:optname = (strlen(k) == 1 ? '-' : '--') . k
        call add(l:options, l:optname)
        call add(l:options, l:optionargs[k])
      endif
    endfor
    " Set MacVim icon if option wasn't passed
    if has_key(l:optionargs, 'a') == 0 && has_key(l:optionargs, 'appIcon') == 0
      call add(l:options, '-a')
      call add(l:options, g:shiraseru_macvim_path)
    endif
    " Create cmd
    let l:cmd = join(l:options)
    " Call cmd
    call vimproc#system_bg(l:cmd)
  endif
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
