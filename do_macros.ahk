
do_macros() ; do_macros:
{
    if(!InStr(A_ScriptName,"_."))
    {
        SplitPath, A_ScriptName,,, f_FileExt, f_FileNoExt
        newscript := concat([f_FileNoExt, "_.ahk"])

        FileDelete % newscript

        pattern=(\w+)_\((.*)\)
        found_pattern=0
        Loop, Read, % A_ScriptName, % newscript
        {
            current_line := A_LoopReadLine
            if(RegExMatch(current_line, pattern, content))
            {
                StringLower, command, content1
                params := content2
                current_line := RegExReplace(current_line, pattern, concat([command,"({ param1: ",params,", linenumber: A_LineNumber })"]))
                found_pattern++
            }
            FileAppend, %current_line%`n
        }
        FileAppend % concat(["FileDelete, ",newscript]) , % newscript
        Run % newscript
        ExitApp
    }
}
