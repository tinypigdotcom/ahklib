
say(p) ; say:
{
    message := p.param1

    insist_NotEmpty({     param1: message
                    ,   function: A_ThisFunc
                    , linenumber: p.linenumber })

    Progress, 9:w500 m2 c00 b fs12 zh0, % message, , , Courier New
    SetTimer, _say_disable_say, -3500

    increment_timers()

    return
}

_say_disable_say:
    Progress, 9:Off
    decrement_timers()
return

