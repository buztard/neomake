" vim: ts=4 sw=4 et

function! neomake#makers#ft#go#EnabledMakers()
    return ['go', 'golint']
endfunction

function! neomake#makers#ft#go#go()
    return {
        \ 'args': [
            \ 'build',
            \ '-o', neomake#utils#DevNull()
        \ ],
        \ 'append_file': 0,
        \ 'errorformat':
            \ '%W%f:%l: warning: %m,' .
            \ '%E%f:%l:%c:%m,' .
            \ '%E%f:%l:%m,' .
            \ '%C%\s%\+%m,' .
            \ '%-G#%.%#'
        \ }
endfunction

function! neomake#makers#ft#go#golint()
    return {
        \ 'errorformat':
            \ '%f:%l:%c: %m,' .
            \ '%-G%.%#'
        \ }
endfunction

function! neomake#makers#ft#go#gometalinter()
    return {
        \ 'args': ['-t', '%:p:h'],
        \ 'append_file': 0,
        \ 'errorformat':
            \ '%E%f:%l:%c:error: %m,' .
            \ '%E%f:%l::error: %m,' .
            \ '%W%f:%l:%c:warning: %m,' .
            \ '%W%f:%l::warning: %m'
        \ }
endfunction
