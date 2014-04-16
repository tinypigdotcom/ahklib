
insist_FileExists(filename)
{
    if ( !FileExist( filename ) )
        die("File {" . filename . "} not found.")
}

