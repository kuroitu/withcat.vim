let s:did_init = 0

"Main
function! withcat#Start(aadir)
    let s:dir = a:aadir

    if !s:did_init
        let s:did_init = 1
        call s:Init()
    endif

    call s:Clear()
    call s:Intro()
endfunction


func s:Init()
    hi def catSun ctermbg=red guibg=red
    hi def catSky ctermbg=blue guibg=blue
    hi def catGrass ctermfg=green guibg=green
endfunc


func s:Clear()
  if s:intro_timer
    call timer_stop(s:intro_timer)
    let s:intro_timer = 0
  endif
  call popup_clear()
endfunc


func s:NoProp(text)
  return #{text: a:text, props: []}
endfunc


let s:start_title = 10
func s:Intro()
    hi CatTitle cterm=bold gui=bold
    hi introHL ctermbg=cyan guibg=cyan
    call prop_type_delete('catTitle')
    call prop_type_add('catTitle', #{highlight: 'CatTitle'})
    call prop_type_delete('introHL')
    call prop_type_add('introHL', #{highlight: 'introHL'})
    let s:intro = popup_create([
            \   #{text: '         I want to play with a cat!',
            \     props: [#{col: s:start_title, length: 26, type: 'catTitle'}]},
	        \   s:NoProp(''),
	        \   s:NoProp('options:'),
            \   #{text: '     1       cat shilhouette',
            \     props: [#{col: 6, length: 1, type: 'catTitle'}]},
	        \   #{text: '   <Esc>     quit (colon also works)',
            \     props: [#{col: 4, length: 5, type: 'catTitle'}]},
	        \   s:NoProp(''),
	        \   s:NoProp('during doing:'),
            \   #{text: '     q       quit',
            \     props: [#{col: 6, length: 1, type: 'catTitle'}]},
            \   #{text: '   ELSE      stop 5 sec and can edit file',
            \     props: [#{col: 4, length: 4, type: 'catTitle'}]},
	        \   s:NoProp(''),
	        \   #{text: 'Now press  optionsNo  to start or  x  to exit',
            \     props: [#{col: 12, length: 8, type: 'catTitle'},
            \             #{col: 36, length: 1, type: 'catTitle'}]},
	        \ ], #{
	        \   filter: function('s:IntroFilter'),
	        \   callback: function('s:IntroClose'),
	        \   border: [],
	        \   padding: [],
	        \   mapping: 0,
	        \   drag: 1,
	        \   close: 'button',
	        \ })
    call s:IntroHighlight(0)
endfunc


func s:IntroFilter(id, key)
    if a:key == '1'
        call s:Clear()
        call s:CatWalk(g:CATSHILHOUETTE)
    elseif a:key == 'x' || a:key == 'X' || a:key == "\<Esc>"
        call s:Clear()
    endif
    return 1
endfunc


func s:IntroClose(id, res)
    call s:Clear()
endfunc


const s:introHL = [[s:start_title, 1],
                \  [s:start_title+2, 4],
                \  [s:start_title+7, 2],
                \  [s:start_title+10, 4],
                \  [s:start_title+15, 4],
                \  [s:start_title+20, 1],
                \  [s:start_title+22, 4]]
let s:intro_timer = 0
func s:IntroHighlight(idx)
    let idx = a:idx
    if idx >= len(s:introHL)
        let idx = 0
    endif
    let buf = winbufnr(s:intro)
    call prop_remove(#{type: 'introHL', bufnr: buf}, 1)
    call prop_add(1, s:introHL[idx][0],
            \     #{length: s:introHL[idx][1], bufnr: buf, type: 'introHL'})
    let s:intro_timer = timer_start(300, { -> s:IntroHighlight(idx + 1)})
endfunc


func s:CatWalk(walker)
    call s:Clear()
    " Init
    let s:popUpWindow = popup_create('', #{
            \ line: 1,
            \ col: 1,
            \ })
    let s:status = 1
    "call win_execute(s:popUpWindow ,'setlocal filetype=withcatHL')

    while s:status
        for i in range(len(a:walker))
            call popup_settext(s:popUpWindow, a:walker[i])
            redraw
            if getchar(0)
                let s:status = 0
                break
            endif
            sleep 100m
        endfor
    endwhile

    "call popup_close(s:popUpWindow)
    "call s:CatWalk()
    if getchar(0) == "q"
        call s:Clear()
        let s:popUpWindow = popup_create([
                \   #{text: 'Good Vim!',
                \     props: [#{col: 1, length: 9, type: 'catTitle'}]},
                \ ], #{
	            \   border: [],
	            \   padding: [],
	            \   mapping: 0,
	            \   drag: 1,
	            \   close: 'button',
                \ })
        call timer_start(2000, { -> s:Clear() })
    else
        call timer_start(5000, { -> s:CatWalk(a:walker) })
    endif
endfunc
