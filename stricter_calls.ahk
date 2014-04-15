#SingleInstance force

SplitPath, A_ScriptName,,, f_FileExt, f_FileNoExt

ini_file_nopath = %f_FileNoExt%.ini
ini_filename = %A_ScriptDir%\%ini_file_nopath%
;IniRead, CustomizationDir, %ini_file%, settings, customization_dir, %A_ScriptDir%
;IniRead, output_var, %ini_filename%, category, variable, %default_value%

IfNotExist, %ini_filename%
    Gosub, build_ini

two := "settings"
three := "rotate_icon"
my_rotate_icon := my_IniRead(ini_filename,two,tthree)
lib_attention("success! my_rotate_icon is {" . my_rotate_icon . "}")
MsgBox, made it

;lib_debug("",1) ;xd
;lib_say("fix A_MyDocuments: " . A_MyDocuments) ;xd
;lib_log("fix test") ;xd
return


build_ini:
    IniWrite, 1, %ini_filename%, settings, rotate_icon
return


my_IniRead(filename,category,variable)
{
    params := "`nparams 1:{" . filename . "} 2:{" . category . "} 3:{" . variable . "}"
    if(filename = "" or category = "" or variable = "")
        lib_die("blank parameter " . params)

    IfNotExist, %filename%
        lib_die("File {" . filename . "} not found.")

    IniRead, retval, %filename%, %category%, %variable%, "INIREAD_ERR_VAR_NOT_SET"
    if ( InStr(retval, "iniread_err_") )
        lib_die(retval . params)

    return %retval%
}


; How debug works:
; ================
; Default level for debug statements is 2.  Debug statements will only print if
; Master Debug Level >= statement level.  So, if you create a level 1 debug
; statement and set Master Debug Level to 1, only that one will print.  Setting
; Master Debug Level to 2 will trigger a lot of debug output.
;
; debug.txt is created in script directory with all debug output
;
; Template debug statement:
;
; lib_debug("myvar: " . myvar,1) ;xd
;
