
;------------------------------------------------------------------------------
say(p) ; say:
;------------------------------------------------------------------------------
{
    global _timers_pending

    insist_NotEmpty({ message:    p.message
                     ,function:   A_ThisFunc
                     ,linenumber: p.linenumber })

    Progress, 9:w500 m2 c00 b fs12 zh0, % p.message, , , Courier New
    SetTimer, _say_disable_say, -3500

    _timers_pending++

    return
}

_say_disable_say:
    Progress, 9:Off
    _timers_pending--
return

