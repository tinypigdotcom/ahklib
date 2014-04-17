#SingleInstance force
;goal: easier to type
;#say("this is a say message")
;__SAY__("this is a say message")
;Loop, Read, A_ScriptName [, OutputFile]

if(SubStr(A_ScriptName,1,1) != "_")
{
    SplitPath, A_ScriptName,,, f_FileExt, f_FileNoExt
    newscript := concat(["__", f_FileNoExt, ".ahk"])

    FileDelete % newscript

    ;pattern=__SAY_[_]\("([^"]*)"\)
    pattern=;#(\w+)\("([^"]*)"\)
    found_pattern=0
    Loop, Read, % A_ScriptName, % newscript
    {
        current_line := A_LoopReadLine
        if(RegExMatch(current_line, pattern, content))
        {
            StringLower, command, content1
            params := content2
            current_line := RegExReplace(current_line, pattern, concat([command,"( """,params,""", { function: ""main"", linenumber: A_LineNumber })"]))
            found_pattern++
        }
        FileAppend, %current_line%`n
    ;    say({ message: A_LoopReadLine, function: "main", linenumber: A_LineNumber })
    ;    wait_for_timers()
    }
    Run % newscript
}
