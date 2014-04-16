
insist_NotEmpty(p)
{
    if(p.function = "")
        die("blank parameter {function} in call to function " . A_ThisFunc . "()")
    For key, value in p
        if(p[key] = "")
            die("blank parameter {" . key . "} in call to function " . p.function . "()")
}

