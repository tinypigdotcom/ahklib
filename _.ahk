
_(p) ; attention_: ; does nothing - just a placeholder for macro to work
{
    die({    message: "Macro function should never be called. Did you remember to do_macros()?"
        ,   function: A_ThisFunc
        , linenumber: p.linenumber })
}

