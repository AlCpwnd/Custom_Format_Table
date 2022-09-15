function Format-CustomTable{
    Param(
        [Parameter(Mandatory,ValueFromPipeline)][Array]$Data,
        [Parameter(Mandatory)][scriptblock]$Condition,
        [Parameter(Mandatory)][ConsoleColor]$Highlight
    )
    $Header = ($Data[0] | Format-Table | Out-String -Stream).split([Environment]::NewLine)[0..2]
    Write-Host -Object "`n$Header"
    foreach($entry in $Data){
        $Output = $entry | Format-Table -HideTableHeaders | Out-String -Stream | Where-Object{$_.trim() -ne ""}
        if($Entry | Where-Object $Condition){
            Write-host -Object $Output -ForegroundColor $Highlight
        }else{
            Write-Host -Object $Output
        }
    }
    Write-Host -Object " "
}