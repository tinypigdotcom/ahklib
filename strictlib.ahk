#SingleInstance force

SplitPath, A_ScriptName,,, f_FileExt, f_FileNoExt

ini_file_nopath = %f_FileNoExt%.init
ini_filename = %A_ScriptDir%\%ini_file_nopath%

;IfNotExist, %ini_filename%
;    Gosub, build_ini

my_rotate_icon := my_IniRead({filename: ini_filename
                            , category: "settings"
                            , variable: "rotate_icon"})

lib_attention("success! my_rotate_icon is {" . my_rotate_icon . "}")

return


build_ini:
    IniWrite, 1, %ini_filename%, settings, rotate_icon
return


my_IniRead(p)
{
    insist_NotEmpty({filename: p.filename, category: p.category, variable: p.variable})

    insist_FileExists(p.filename)

    param_list := "`nparams 1:{" . p.filename . "} 2:{" . p.category . "} 3:{" . p.variable . "}"

    IniRead retval, % p.filename, % p.category, % p.variable, "INIREAD_ERR_VAR_NOT_SET"
    if ( InStr(retval, "iniread_err_") )
        lib_die(retval . param_list)

    return %retval%
}


insist_NotEmpty(p)
{
    For key, value in p
        if(p[key] = "")
            lib_die("blank parameter {" . key . "} value {" . p[key] . "}")
}


insist_FileExists(filename)
{
    if ( !FileExist( filename ) )
        lib_die("File {" . filename . "} not found.")
}


