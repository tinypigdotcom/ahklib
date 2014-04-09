
;------------------------------------------------------------------------------
lib_warn(warn_text) ; lib_warn:
;------------------------------------------------------------------------------
{
    warn_text := A_ScriptName . ": " . warn_text

    Progress, cwFFFF00 m2 c00 b fs12 zh0, %warn_text%, , , Courier New
    SetTimer, _warn_disable_warning, -3500
    lib_Debug(warn_text,1)
    return
}

_warn_disable_warning:
    Progress, Off
return

