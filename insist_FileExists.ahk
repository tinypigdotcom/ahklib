
insist_FileExists(p)
{
    insist_NotEmpty({   filename: p.filename
                    ,   function: A_ThisFunc
                    , linenumber: p.linenumber })
    if ( !FileExist( p.filename ) )
        die({    message: concat(["File {", p.filename, "} not found."])
            ,   function: p.function
            , linenumber: p.linenumber })
}

