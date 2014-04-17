
warn(p) ; warn:
{
    global _timers_pending

    insist_NotEmpty({    message: p.message
                    ,   function: A_ThisFunc
                    , linenumber: p.linenumber })

    p.message := concat([A_ScriptName, ": ", p.message, " at line ", p.linenumber])


    Progress, 10:w500 cwFFFF00 m2 c00 b fs12 zh0, % p.message, , , Courier New
    p.debug_level := 1
    debug(p)
    SetTimer, _warn_disable_warn, -3500

    _timers_pending++

    return
}

_warn_disable_warn:
    Progress, 10:Off
    _timers_pending--
return

