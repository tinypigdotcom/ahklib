
f_IniRead(p)
{
    p.function := A_ThisFunc

    insist_NotEmpty({ filename:   p.filename
                     ,category:   p.category
                     ,variable:   p.variable
                     ,function:   p.function
                     ,linenumber: p.linenumber })

    insist_FileExists(p)

    param_list := concat(["`nparams 1:{", p.filename, "} 2:{", p.category, "} 3:{", p.variable, "}"])

    IniRead retval, % p.filename, % p.category, % p.variable, "INIREAD_ERR_VAR_NOT_SET"
    if ( InStr(retval, "iniread_err_") )
        die({    message: concat([retval, param_list])
            ,   function: p.function
            , linenumber: p.linenumber })


    return %retval%
}


