
;------------------------------------------------------------------------------
warn(warn_text) ; warn:
;------------------------------------------------------------------------------
{
    warn_text := A_ScriptName . ": " . warn_text

    Progress, 10:w500 cwFFFF00 m2 c00 b fs12 zh0, %warn_text%, , , Courier New
    debug(warn_text,1)
    SetTimer, _warn_disable_warn, -3500
    return
}

_warn_disable_warn:
    Progress, 10:Off
return
