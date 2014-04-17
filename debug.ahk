
;debug VERSION=0.0.1

;TODO
;====
;tip_channel should be an option
;debug_level is a setting that should be in the calling script

; How debug works:
; ================
; Default level for debug statements is 2.  Debug statements will only print if
; Master Debug Level >= statement level.  So, if you create a level 1 debug
; statement and set Master Debug Level to 1, only that one will print.  Setting
; Master Debug Level to 2 will trigger a lot of debug output.
;
; debug.txt is created in script directory with all debug output
;
; Template debug statement:
;
; debug("myvar: " . myvar,1) ;xd
;

debug(p) ; debug:
{
    global global_debug_level

    insist_NotEmpty({    message: p.message
                    ,   function: A_ThisFunc
                    , linenumber: p.linenumber })

    if(!global_debug_level)
        global_debug_level := 1
    if(!p.debug_level)
        p.debug_level := 2

    FormatTime, TimeString,, yyyy-MM-dd HH:mm
    if(global_debug_level >= p.debug_level)
    {
        flog(p.message)
        _debug_text(p.message)
    }
    return
}


_debug_text(message) ; _debug_text:
{
    global _debug_y_offset
    global _debug_text

    tip_channel=3

    debug_x := A_ScreenWidth  - 400
    debug_y := A_ScreenHeight - 75

    if _debug_text
    {
        _debug_text = %_debug_text%`n.    %message%
    }
    else
    {
        _debug_text = .    %message%
    }
    _debug_y_offset += 12
    tmp_debug_y := debug_y - _debug_y_offset
    _debug_show_tip(_debug_text . "    `n", debug_x, tmp_debug_y, tip_channel)
    SetTimer, _debug_disableTip, -9000
    return
}


_debug_disableTip:
{
    global _debug_y_offset
    global _debug_text

    tip_channel=3
    _debug_y_offset = 0
    _debug_text=
    _debug_clear_tip(tip_channel)
    return
}


_debug_show_tip(text="",posx="",posy="",channel=1) ; _debug_show_tip:
{
    global _timers_pending
    ToolTip %text%, %posx%, %posy%, %channel%
    _timers_pending++
    return
}


_debug_clear_tip(channel=1) ; _debug_clear_tip:
{
    global _timers_pending
    ToolTip,,,,%channel%
    _timers_pending--
    return
}


