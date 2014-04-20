
attention(p)
{
    global _attention_wait_count
    static _attention_buttoncounter

    message := p.param1

    insist_NotEmpty({     param1: message
                    ,   function: A_ThisFunc
                    , linenumber: p.linenumber })

    _attention_wait_count=3
    Gui _attention:Default

    Gui, font, s14

    Gui, Add, Button, default x282 y60 w100 h30 v_attention_buttoncounter, OK
    Gui -MinimizeBox -MaximizeBox

    Gui, Add, Text, x12 y10 w380 h76 , % message
    ; Generated using SmartGUI Creator 4.0
    Gui, Show, x516 y238 h103 w396, % concat(["Attention! from ", A_ScriptName])
    GuiControl, _attention:, _attention_buttoncounter, OK (%_attention_wait_count%)
    GuiControl, Disable, _attention_buttoncounter

    Loop,%_attention_wait_count%
    {
        sleep, 1000
        _attention_wait_count--
        GuiControl, _attention:, _attention_buttoncounter, OK (%_attention_wait_count%)
    }
    GuiControl, _attention:, _attention_buttoncounter, OK
    GuiControl, _attention:Enable, _attention_buttoncounter
    WinWaitClose, Attention! ; E-SLP: Sloppy! How do we know it's the one??
}

_attentionGuiClose:
    global _attention_wait_count

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

