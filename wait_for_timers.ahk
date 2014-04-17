
wait_for_timers() ; wait_for_timers:
{
    global
    Loop
    {
        Sleep, 100
        if(_timers_pending <= 0)
            return
    }
}


