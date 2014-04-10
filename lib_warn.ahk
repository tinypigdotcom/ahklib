
;------------------------------------------------------------------------------
lib_warn(warn_text) ; lib_warn:
;------------------------------------------------------------------------------
{
    warn_text := A_ScriptName . ": " . warn_text

    Progress, w500 cwFFFF00 m2 c00 b fs12 zh0, %warn_text%, , , Courier New
    lib_Debug(warn_text,1)
    Sleep, 3500 ;If we set a timer instead, it doesn't show up!
    return
}

