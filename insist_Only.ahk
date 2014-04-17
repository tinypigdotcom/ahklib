
insist_Only(l,p)
{
    r := {function:1,linenumber:1}
    Loop % l.MaxIndex()
        r[l[A_Index]] := 1


    For key, value in p
        if(!r[key])
            die({    message: concat(["bad parameter {", key, "} vs acceptable {", join(",",l), "}"])
                ,   function: p.function
                , linenumber: p.linenumber })

}

