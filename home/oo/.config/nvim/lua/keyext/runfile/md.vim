

let exist = system('ps -e |grep -v "grep" |grep -c "firefox"')
" echo exist


if exist != 0
  echo 000
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
  function OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
    endfunction
  endif

MarkdownPreviewToggle


