if get(g:, 'loaded_withcat', 0)
    finish
endif
let g:loaded_withcat = 1

let s:dir = expand('<sfile>:h')

command WithCat call s:StartWithCat()

func s:StartWithCat()
    " Check features before loading the autoload file to avoid error messages.
    if !has('patch-8.1.1705')
        call s:Sorry('Sorry, This build of Vim is too old, you need at least 8.1.1705')
        return
    endif
    if !has('textprop')
        call s:Sorry('Sorry, This build of Vim is lacking the +textprop feature')
        return
    endif
"   if &lines < 45
"       call s:Sorry('Need at least a terminal height of 45 lines')
"       return
"   endif

    " The implementation is in an autoload file, so that this plugin doesn't
    " take much time when not being used.
    call withcat#Start(s:dir)
endfunc

func s:Sorry(msg)
    echohl WarningMsg
    echo a:msg
    echohl None
endfunc
