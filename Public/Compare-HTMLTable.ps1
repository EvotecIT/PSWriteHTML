function Compare-HTMLTable {
    [cmdletBinding()]
    param(
        [Array[]] $Objects,
        [Parameter(Mandatory)][string[]] $MatchingProperty
    )
    $OutputHash = [ordered] @{}
    $OutputHighlights = [ordered] @{}
    if ($Objects.Count -gt 1) {
        [Array] $PrimaryObjects = $Objects[0]
        $OutputHash['0'] = [System.Collections.Generic.List[object]]::new()
        $Line = 0
        foreach ($Primary in $PrimaryObjects) {
            $Line++
            $OutputHash[0].Add($Primary)
            $Count = 0
            foreach ($Object in $Objects | Select-Object -Skip 1) {
                $Count++
                $Found = $false
                if (-not $OutputHash["$Count"]) {
                    $OutputHash["$Count"] = [System.Collections.Generic.List[object]]::new()
                    $OutputHighlights["$Count"] = [System.Collections.Generic.List[object]]::new()
                }
                foreach ($O in $Object) {
                    if ($O.$MatchingProperty -eq $Primary.$MatchingProperty) {

                        $DataTable = Compare-MultipleObjects -Objects $Primary, $O -Summary
                        for ($i = 1; $i -lt $DataTable.Count; $i++) {
                            if ($DataTable[$i].Status -eq $false) {
                                $DifferenceColumn = 1
                                $DataSame = $DataTable[$i]."$DifferenceColumn-Same" -join $Splitter
                                $DataAdd = $DataTable[$i]."$DifferenceColumn-Add" -join $Splitter
                                $DataRemove = $DataTable[$i]."$DifferenceColumn-Remove" -join $Splitter

                                if ($DataSame -ne '') {
                                    $DataSame = "$DataSame$Splitter"
                                }
                                if ($DataAdd -ne '') {
                                    $DataAdd = "$DataAdd$Splitter"
                                }
                                if ($DataRemove -ne '') {
                                    $DataRemove = "$DataRemove$Splitter"
                                }
                                if ($DataAdd -and $DataRemove) {
                                    $Text = New-HTMLText -Text $DataAdd, $DataRemove -Color Red, Chartreuse -TextDecoration line-through, none -FontWeight bold, bold
                                } elseif ($DataRemove) {
                                    $Text = New-HTMLText -Text $DataRemove -Color Chartreuse -TextDecoration none -FontWeight bold
                                } else {
                                    # Won't really happen but lets see..
                                    $Text = New-HTMLText -Text $DataAdd -Color Blue -TextDecoration none -FontWeight bold
                                }
                                $Out = New-TableContent -ColumnName $DataTable[$i].Name -RowIndex $Line -Text "$Text"
                                $OutputHighlights["$Count"].Add($Out)
                            }
                        }
                        $OutputHash["$Count"].Add($O)
                        $Found = $true
                        break
                    }
                }
                if (-not $Found) {
                    $OutputHash["$Count"].Add('')
                }
            }
        }
        if ($Standard) {
            New-HTML {
                New-HTMLSection -Invisible {
                    foreach ($Key in $OutputHash.Keys | Select-Object -First 1) {
                        New-HTMLSection -HeaderText $Key {
                            New-HTMLTable -DataTable $OutputHash["$Key"]
                        }
                    }
                    foreach ($Key in $OutputHash.Keys | Select-Object -Skip 1) {
                        New-HTMLSection -HeaderText $Key {
                            New-HTMLTable -DataTable $OutputHash["$Key"] {
                                $OutputHighlights["$Key"]
                            } -HideFooter
                        }
                    }

                }
            } -Online -ShowHTML -FilePath $Env:USERPROFILE\Desktop\Test.html
        } else {
            $OutputHighlights
        }
    }
}