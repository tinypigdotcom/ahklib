
;E-DTT redefinition of built-in function log() fails silently and call to
;log() with non-numeric value fails silently.

flog(log_text) ; flog:
{
    FormatTime, TimeString,, yyyy-MM-dd HH:mm
    diagnostic_info=%TimeString% %A_ScriptName%
    FileAppend, %diagnostic_info%: %log_text%`r`n, %A_ScriptDir%\debug.txt
    return
}

