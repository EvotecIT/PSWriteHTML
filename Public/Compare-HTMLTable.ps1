function Compare-HTMLTable {
    [cmdletBinding()]
    param(
        [Parameter(Mandatory)][Array[]] $Objects,
        [Parameter(Mandatory)][string[]] $MatchingProperty,
        [switch] $Standard
    )
    $OutputHash = [ordered] @{}
    $OutputHighlights = [ordered] @{}
    $UsedObjects = [ordered] @{}
    $UsedObjectsNew = [ordered] @{}
    if ($Objects.Count -gt 1) {
        [Array] $PrimaryObjects = $Objects[0]
        $OutputHash['0'] = [System.Collections.Generic.List[object]]::new()
        $OutputHighlights["0"] = [System.Collections.Generic.List[object]]::new()
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
                    $UsedObjectsNew["$Count"] = [ordered] @{}
                }

                foreach ($O in $Object) {
                    if ($O.$MatchingProperty -eq $Primary.$MatchingProperty) {
                        $UsedObjectsNew["$Count"]["$($O.$MatchingProperty)"] = $O
                        $UsedObjects["$($O.$MatchingProperty)"] = $O
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
                    <# This is if we would like to be dummy/empty object
                    # Building Dummy object
                    $Properties = Select-Properties -Objects $Objects[0]
                    $DummyObject = [ordered] @{}
                    foreach ($Property in $Properties) {
                        $DummyObject[$Property] = ''
                    }
                    if ($Object -is [System.Collections.IDictionary]) {
                        $OutputHash["$Count"].Add($DummyObject)
                    } else {
                        $OutputHash["$Count"].Add( [PSCustomObject] $DummyObject)
                    }
                    #>
                    # And this one adds missing object to destination but marks it red
                    $Properties = Select-Properties -Objects $Primary
                    $Out = New-TableContent -ColumnName $Properties -RowIndex $Line -Color Red
                    $OutputHash["$Count"].Add($Primary)
                    $OutputHighlights["$Count"].Add($Out)
                }
            }
        }
        # This stage adds any missing objects to destinations that were not found in source
        # If we don't do that we just show comparison with original, but we're cutting out other objects
        $Count = 0
        foreach ($Object in $Objects | Select-Object -Skip 1) {
            $Count++
            foreach ($O in $Object) {
                $StartCount = $OutputHash["$Count"].Count
                if (-not $UsedObjectsNew["$Count"]["$($O.$MatchingProperty)"] ) {
                    $StartCount++
                    $Properties = Select-Properties -Objects $O
                    $ColumnIndex = 0..$($Properties.Count)
                    # Add data to Source
                    # But i think we should leave source as source without anything in it
                    #$OutputHash[0].Add($O)
                    #$Out = New-TableContent -ColumnIndex $ColumnIndex -RowIndex $StartCount -Color Red #-Text "$Text"
                    #$OutputHighlights[0].Add($Out)

                    # add missing data to destination
                    $OutputHash["$Count"].Add($O)
                    $Out = New-TableContent -ColumnIndex $ColumnIndex -RowIndex $StartCount -Color Green #-Text "$Text"
                    $OutputHighlights["$Count"].Add($Out)
                }
            }
        }

        <#
        if ($Objects.Count -eq 2) {
            # This is only applicable to two arrays, if more arrays is being compared it will be skipped because we don't know which one we want to target
            $StartCount = $OutputHash[0].Count
            foreach ($O in $Object) {
                if (-not $UsedObjects["$($O.$MatchingProperty)"]) {
                    $StartCount++
                    $Properties = Select-Properties -Objects $O
                    $ColumnIndex = 0..$($Properties.Count)
                    # Add data to Source
                    # But i think we should leave source as source without anything in it
                    #$OutputHash[0].Add($O)
                    #$Out = New-TableContent -ColumnIndex $ColumnIndex -RowIndex $StartCount -Color Red #-Text "$Text"
                    #$OutputHighlights[0].Add($Out)

                    # add missing data to destination
                    $OutputHash[1].Add($O)
                    $Out = New-TableContent -ColumnIndex $ColumnIndex -RowIndex $StartCount -Color Green #-Text "$Text"
                    $OutputHighlights[1].Add($Out)
                }
            }
        }
        #>
        if ($Standard) {
            New-HTML {
                New-HTMLSection -Invisible {
                    foreach ($Key in $OutputHash.Keys | Select-Object -First 1) {
                        New-HTMLSection -HeaderText $Key {
                            New-HTMLTable -DataTable $OutputHash["$Key"] {
                                $OutputHighlights["0"]
                            } -DisablePaging -HideFooter
                        }
                    }
                    foreach ($Key in $OutputHash.Keys | Select-Object -Skip 1) {
                        New-HTMLSection -HeaderText $Key {
                            New-HTMLTable -DataTable $OutputHash["$Key"] {
                                $OutputHighlights["$Key"]
                            } -HideFooter -DisablePaging
                        }
                    }
                }
            } -Online -ShowHTML -FilePath $Env:USERPROFILE\Desktop\Test.html
        } else {
            $OutputHighlights
        }
    }
}