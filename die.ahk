
;------------------------------------------------------------------------------
die(die_text) ; die:
;------------------------------------------------------------------------------
{
    die_text := "FATAL ERROR: " . die_text
    log(die_text)
    MsgBox, 4096, , %die_text%
    ExitApp
}

