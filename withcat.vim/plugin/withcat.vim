let s:PATTERN1 = [
    \[
    \ "     ,,                             "
    \ "   I$MNM,                           "
    \ "=MMMMMMM:                           "
    \ ",:MMMMMM,                           "
    \ " +MMMMMM~                           "
    \ ",MMMMMMMMMM?                        "
    \ "MMMMMMMMMMMMMMM                     "
    \ " MMMMMMMMMMMMMMMM                   "
    \ " ,OMMMMMMMMMMMMMMM                  "
    \ "   MMMMMMMMMMMMMMM:                 "
    \ "  =MMM$MMMMMMMMMMMI                 "
    \ "  MMM  ,=MMMMMMMMM=                 "
    \ "MMMM,  ,MMMMMMMMMMMM=~~::,:~~~=+I8M7"
    \ " ,:     ODMNOZZ7+,:::~::,,,,        "
    \],
]

"mainmain

"Main
function! WithCat()
    " Init
    let s:popUpWindow = popup_create("", {})
    let s:status = 1
    " call win_execute(s:popUpWindow ,'setlocal filetype=withcatHL')

    while s:status
        for i in range(12)
            call popup_settext(s:popUpWindow, s:PATTERN1[i])
            redraw
            if getchar(0)
                let s:status = 0
                break
            endif
            sleep 85m
        endfor
    endwhile

    call popup_close(s:popUpWindow)
endfunction
command! WithCat call WithCat()
