
warn(p) ; warn:
{

    message := p.param1

    insist_NotEmpty({     param1: message
                    ,   function: A_ThisFunc
                    , linenumber: p.linenumber })

    message := concat([A_ScriptName, ": ", message, " at line ", p.linenumber])


    Progress, 10:w500 cwFFFF00 m2 c00 b fs12 zh0, % message, , , Courier New
    p.debug_level := 1
    debug(p)
    SetTimer, _warn_disable_warn, -3500

    increment_timers()

    return
}

_warn_disable_warn:
    Progress, 10:Off
    decrement_timers()
return

