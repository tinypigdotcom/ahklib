
join(join_text,p)
{
    retval := ""

    Loop % p.MaxIndex()
    {
        retval .= p[A_Index]
;say({message: concat(["A_Index {",A_Index,"} p.MaxIndex {",p.MaxIndex,"}"]), function: "join", linenumber: A_LineNumber})
;wait_for_timers()
        if(A_Index < p.MaxIndex())
            retval .= join_text
    }

    return %retval%
}

