
insist_NotEmpty(p)
{
    For key, value in p
        if(p[key] = "")
            die("blank parameter {" . key . "} value {" . p[key] . "}")
}

