
insist_NotEmpty(p)
{
    ;"insist" that these passed variables are not empty either
    p.scriptname := p.scriptname
    p.linenumber := p.linenumber
    p.function   := p.function

    For key, value in p
        if(p[key] = "")
            die( "blank parameter {"      . key
               . "} in call to function " . p.function
               . "() from "               . p.scriptname
               . " at line "              . p.linenumber )
}


