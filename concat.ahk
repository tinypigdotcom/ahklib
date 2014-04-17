
concat(p)
{
    retval := ""
    Loop % p.MaxIndex()
        retval .= p[A_Index]
    return %retval%
}

