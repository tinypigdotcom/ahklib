
;------------------------------------------------------------------------------
log(log_text) ; log:
;------------------------------------------------------------------------------
{
    FormatTime, TimeString,, yyyy-MM-dd HH:mm
    diagnostic_info=%TimeString% %A_ScriptName%
    FileAppend, %diagnostic_info%: %log_text%`r`n, %A_ScriptDir%\debug.txt
    return
}

