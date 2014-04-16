
;------------------------------------------------------------------------------
warn(warn_text) ; warn:
;------------------------------------------------------------------------------
{
    global
    _warn_text := A_ScriptName . ": " . _warn_text

    Progress, 10:w500 cwFFFF00 m2 c00 b fs12 zh0, %_warn_text%, , , Courier New
    debug(_warn_text,1)
    SetTimer, _warn_disable_warn, -3500
    _timers_pending++
    return
}

_warn_disable_warn:
    Progress, 10:Off
    _timers_pending--
return

