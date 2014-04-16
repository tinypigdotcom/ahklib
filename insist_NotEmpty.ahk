
insist_NotEmpty(p)
{
    ;"insist" that these passed variables are not empty either
    p.scriptname := p.scriptname
    p.linenumber := p.linenumber
    p.function := p.function
;    if(p.function = "")
;        die("blank parameter {function} in call to function " . A_ThisFunc . message_tail)
    For key, value in p
        if(p[key] = "")
            die("blank parameter {" . key . "} in call to function " . p.function . "() from " . p.scriptname . " at line " . p.linenumber)
}


