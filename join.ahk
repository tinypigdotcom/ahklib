
join(join_text,p)
{
    retval := ""

    Loop % p.MaxIndex()
    {
        retval .= p[A_Index]
        if(A_Index < p.MaxIndex())
            retval .= join_text
    }

    return %retval%
}

