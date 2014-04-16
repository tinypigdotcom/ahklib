
f_IniRead(p)
{
    insist_NotEmpty({filename: p.filename, category: p.category, variable: p.variable})

    insist_FileExists(p.filename)

    param_list := "`nparams 1:{" . p.filename . "} 2:{" . p.category . "} 3:{" . p.variable . "}"

    IniRead retval, % p.filename, % p.category, % p.variable, "INIREAD_ERR_VAR_NOT_SET"
    if ( InStr(retval, "iniread_err_") )
        die(retval . param_list)

    return %retval%
}


