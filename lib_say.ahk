
;------------------------------------------------------------------------------
lib_say(say_text) ; lib_say:
;------------------------------------------------------------------------------
{
    Progress, 9:w500 m2 c00 b fs12 zh0, %say_text%, , , Courier New
    SetTimer, _say_disable_say, -3500

    return
}

_say_disable_say:
    Progress, 9:Off
return

