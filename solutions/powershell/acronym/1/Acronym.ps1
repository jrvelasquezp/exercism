Function Get-Acronym() {
    <#
    .SYNOPSIS
    Get the acronym of a phrase.

    .DESCRIPTION
    Given a phrase, return the string acronym of that phrase.
    "As Soon As Possible" => "ASAP"
    
    .PARAMETER Phrase
    The phrase to get the acronym from.
    
    .EXAMPLE
    Get-Acronym -Phrase "As Soon As Possible"
    #>
    [CmdletBinding()]
    Param (
        [string]$Phrase
    )
    $Phrase=$Phrase.Replace("-"," ")
    $Phrase=$Phrase.Replace(","," ")
    $Phrase=$Phrase.Replace("_"," ")
    $Phrase=$Phrase.Replace("'","")
    $Phrase=$Phrase.Replace("  "," ")
    $Phrase=$Phrase.Replace("  "," ")
    $WordList=$Phrase.split(" ")
    $WordCount=$WordList.Count
    for($i=0;$i -lt $WordCount; $i++){
        $WordList.SetValue($WordList[$i].Substring(0,1).ToUpper(),$i)
    }
    -join $WordList
}