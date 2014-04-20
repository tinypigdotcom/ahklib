
do_macros() ; do_macros:
{
    ; Don't run if we're the temporary "macro-fied" version
    if(InStr(A_ScriptName,"_."))
        return

    SplitPath, A_ScriptName,,, f_FileExt, f_FileNoExt
    newscript := concat([f_FileNoExt, "_.ahk"])

    FileDelete % newscript

    pattern=(\w+)_\((.*)\)
    comment=^\s*;
    found_pattern=0
    FileAppend, put_back()`n, % newscript
    Loop, Read, % A_ScriptName, % newscript
    {
        current_line := A_LoopReadLine
        if(!RegExMatch(current_line, comment))
        {
            if(RegExMatch(current_line, pattern, content))
            {
                FileAppend, `;%current_line%`n
                StringLower, command, content1
                params := content2
                current_line := RegExReplace(current_line, pattern, concat([command,"({ param1: ",params,", linenumber: A_LineNumber })"]))
                found_pattern++
            }
        }
        FileAppend, %current_line%`n
    }
    if(found_pattern)
    {
        Run % newscript
        ExitApp
    }
    else
    {
        FileDelete % newscript
        return
    }
}
