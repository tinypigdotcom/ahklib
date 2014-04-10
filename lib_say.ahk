
;------------------------------------------------------------------------------
lib_say(say_text) ; lib_say:
;------------------------------------------------------------------------------
{
    Progress, w500 m2 c00 b fs12 zh0, %say_text%, , , Courier New
    Sleep, 3500 ; If we set a timer, it doesn't show up!

    return
}

