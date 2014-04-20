
do_macros() ; do_macros:
{
    ; Don't run if we're the temporary "macro-fied" version
    if(InStr(A_ScriptName,"_."))
        return

    SplitPath, A_ScriptName,,, f_FileExt, f_FileNoExt
    newscript := concat([f_FileNoExt, "_.ahk"])

    FileDelete % newscript

    pattern=^(\s*)_\(\{\s*(\w+):(.*)\s*\}\)
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
                content2 = %content2%
                content3 = %content3%
                comment_line := RegExReplace(current_line, "^(\s*)", "$1;")
                FileAppend, %comment_line%`n
                StringLower, command, content2
                params := content3
                current_line := concat([ content1, RegExReplace(current_line, pattern, concat([command,"({ param1: ",params,", linenumber: A_LineNumber })"])) ])
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
