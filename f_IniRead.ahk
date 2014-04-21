; example call:
;
; max_vol := f_IniRead({ filename:   my_ini_file
;                      , category:   "settings"
;                      , variable:   "max_volume"
;                      , linenumber: A_LineNumber })

f_IniRead(p)
{
    p.function := A_ThisFunc

    insist_Only([ "filename", "category", "variable", "not_found_ok" ], p)

    insist_NotEmpty({ filename:   p.filename
                    , category:   p.category
                    , variable:   p.variable
                    , function:   p.function
                    , linenumber: p.linenumber })

    insist_FileExists(p)

    param_list := concat([ "`nparams 1:{"
                         , p.filename
                         , "} 2:{"
                         , p.category
                         , "} 3:{"
                         , p.variable
                         , "}"])

    IniRead retval
        , % p.filename
        , % p.category
        , % p.variable
        , INIREAD_ERR_VAR_NOT_SET

    if ( retval = "INIREAD_ERR_VAR_NOT_FOUND" )
    {
        if ( p.not_found_ok )
            retval := ""
        else
            die({    message: concat([retval, param_list])
                ,   function: p.function
                , linenumber: p.linenumber })
    }

    return %retval%
}

