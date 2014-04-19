
put_back() ; put_back:
{
    if(InStr(A_ScriptName,"_."))
    {
        StringReplace, newscript, A_ScriptName, _., .

        FileDelete % newscript

        Loop, Read, % A_ScriptName, % newscript
        {
            if(!InStr(A_LoopReadLine,"put_back()"))
                FileAppend, %A_LoopReadLine%`n
        }
        FileDelete % A_ScriptName
        Run % newscript
        ExitApp
    }
}
