
insist_NotEmpty(p)
{
    ;"insist" that these passed variables are not empty either
    p.linenumber := p.linenumber
    p.function   := p.function
    For key, value in p
        if(p[key] = "")
            die({    message: concat(["blank parameter {", key, "}"])
                ,   function: p.function
                , linenumber: p.linenumber })
}


