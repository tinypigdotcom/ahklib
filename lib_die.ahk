
;------------------------------------------------------------------------------
lib_die(die_text) ; lib_die:
;------------------------------------------------------------------------------
{
    die_text := "(die) " . die_text
    lib_log(die_text)
    MsgBox, 4096, , %die_text%
    ExitApp
}

