
attention(p)
{
    global

    insist_NotEmpty({message: p.message, function: A_ThisFunc})

    _attention_wait_count=3
    Gui _attention:Default

    Gui, font, s14

    Gui, Add, Button, default x282 y60 w100 h30 v_attention_WaitCount, OK
    Gui -MinimizeBox -MaximizeBox

    Gui, Add, Text, x12 y10 w380 h76 , % p.message
    ; Generated using SmartGUI Creator 4.0
    Gui, Show, x516 y238 h103 w396, % "Attention! from " . A_ScriptName
    GuiControl, _attention:, _attention_WaitCount, OK (%_attention_wait_count%)
    GuiControl, Disable, _attention_WaitCount

    Loop,%_attention_wait_count%
    {
        sleep, 1000
        _attention_wait_count--
        GuiControl, _attention:, _attention_WaitCount, OK (%_attention_wait_count%)
    }
    GuiControl, _attention:, _attention_WaitCount, OK
    GuiControl, _attention:Enable, _attention_WaitCount
    WinWaitClose, Attention! ; E-SLP: Sloppy! How do we know it's the one??
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
return


