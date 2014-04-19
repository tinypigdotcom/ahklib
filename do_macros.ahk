
do_macros() ; do_macros:
{
    if(!InStr(A_ScriptName,"_."))
    {
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
                if(InStr(A_LoopReadLine,"do_macros()"))
                    FileAppend, `;%current_line%`n
                else if(RegExMatch(current_line, pattern, content))
                {
                    FileAppend, `;%current_line%`n
                    StringLower, command, content1
                    params := content2
                    current_line := RegExReplace(current_line, pattern, concat([command,"({ param1: ",params,", linenumber: A_LineNumber })"]))
                    found_pattern++
                }
            }
            if(!InStr(A_LoopReadLine,"do_macros()"))
                FileAppend, %current_line%`n
        }
;        FileAppend % concat(["FileDelete, ",newscript]) , % newscript
        Run % newscript
        ExitApp
    }
}
