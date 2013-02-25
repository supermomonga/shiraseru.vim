" Growlnotify wrapper for vimshell
" Version: 0.0.1
" Author : supermomonga (@supermomonga)

if exists('g:loaded_shiraseru')
  finish
endif
let g:loaded_shiraseru = 1

let s:save_cpo = &cpo
set cpo&vim


" Default settings
" let g:shiraseru_ = get(g:, 'shiraseru_', '')
let g:shiraseru_macvim_path = get(g:, 'shiraseru_macvim_path', '/Applications/MacVim.app')
let g:shiraseru_growlnotify_path = get(g:, 'shiraseru_growlnotify_path', '/usr/local/bin/growlnotify')
let g:shiraseru_options = get(g:, 'shiraseru_options', [
          \ 'h', 'help',
          \ 'v', 'version',
          \ 'n', 'name',
          \ 's', 'sticky',
          \ 'a', 'appIcon',
          \ 'i', 'icon',
          \ 'I', 'iconpath', 'image',
          \ 'p', 'priority',
          \ 'd', 'identifier',
          \ 'H', 'host',
          \ 'P', 'password',
          \ 'w', 'wait',
          \ 'url'
          \ ])

let &cpo = s:save_cpo
unlet s:save_cpo
