
attention(p)
{
    global

    if(_attention_exists)
    {
        MsgBox % A_ThisFunc . " already running, message: " . p.message
        return
    }

    _attention_exists=1

    insist_NotEmpty({message: p.message, function: A_ThisFunc})

    _attention_wait_count=4
    Gui _attention:Default

;    Gui, font, s14, Times New Roman
    Gui, font, s14

    Gui, Add, Button, default x282 y60 w100 h30 v_attention_WaitCount, OK
    Gui -MinimizeBox -MaximizeBox

    Gui, Add, Text, x12 y10 w380 h76 , % p.message
    ; Generated using SmartGUI Creator 4.0
    Gui, Show, x516 y238 h103 w396, % "Attention! from " . A_ScriptName
    GuiControl, _attention:, _attention_WaitCount, OK (%_attention_wait_count%)
    GuiControl, Disable, _attention_WaitCount

    SetTimer,_attention_run_down_timer,1000
}


_attentionGuiClose:
    if(_attention_wait_count = 0)
        Goto, _attention_end
    else
        Gui _attention:Show
return


_attentionButtonOK:
    Goto, _attention_end


_attention_end:
    Gui _attention:Destroy
    _attention_exists=0
return


_attention_run_down_timer:
    _attention_wait_count--
    if(_attention_wait_count = 0)
    {
        GuiControl, _attention:, _attention_WaitCount, OK
        GuiControl, _attention:Enable, _attention_WaitCount
        SetTimer,_attention_run_down_timer,off
    }
    else
    {
        GuiControl, _attention:, _attention_WaitCount, OK (%_attention_wait_count%)
    }
return

