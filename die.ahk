
die(p) ; die:
{
    die_text := concat(["FATAL ERROR: "         , p.message
                      , " in call to function " , p.function
                      , "() from "              , A_ScriptName
                      , " at line "             , p.linenumber])

    flog(die_text)
    MsgBox, 4096, , %die_text%
    ExitApp
}

