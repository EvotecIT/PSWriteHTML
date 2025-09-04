function Convert-TableConditionsToHighlighterRules {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][System.Collections.IEnumerable] $ConditionalFormatting,
        [Parameter(Mandatory)][string[]] $Header
    )

    # Build rules with idiomatic array comprehensions for clarity and simplicity
    [array] $rules = @(
        foreach ($Entry in $ConditionalFormatting) {
            if (-not $Entry) { continue }

            $ct = $Entry.ConditionType

            if ($ct -eq 'Condition') {
            # Single condition or unconditional highlight
            $isUnconditional = ($Entry.PSObject.Properties.Name -notcontains 'Value') -or ($null -eq $Entry.Value)
            if (-not $isUnconditional) {
                $cond = New-TablePluginCondition -Condition $Entry
            }

                # Determine target names
                $targetNames = if ($Entry.Row) {
                    $Header
                } elseif ($Entry.HighlightHeaders) {
                    $Entry.HighlightHeaders
                } else {
                    @($Entry.Name)
                }

            # Build targets
            $fill = $null
            if ($Entry.ChildRowFill) {
                if ($Entry.ChildRowFill -eq 'Parent') { $fill = 'parent' }
                elseif ($Entry.ChildRowFill -eq 'Both') { $fill = 'both' }
            }
            [array] $targets = @(
                foreach ($n in $targetNames) {
                    $t = [ordered]@{
                        column = $n
                        css    = $Entry.Style
                    }
                    if ($fill) { $t['fill'] = $fill }
                    $t
                }
            )

                # Build failTargets, if any
                $failTargets = $null
            if ($Entry.FailStyle.Keys.Count -gt 0) {
                $failTargets = @(
                    foreach ($n in $targetNames) {
                        $ft = [ordered]@{
                            column = $n
                            css    = $Entry.FailStyle
                        }
                        # Do not propagate fill to fail targets by default
                        $ft
                    }
                )
            }

                if ($isUnconditional) {
                    $rule = [ordered]@{
                        conditionsContainer = @() # unconditional
                        targets             = $targets
                    }
                } else {
                    $rule = [ordered]@{
                        conditionsContainer = @(
                            [ordered]@{
                                logic      = 'AND'
                                conditions = @($cond)
                            }
                        )
                        targets             = $targets
                    }
                }
                if ($failTargets) {
                    $rule['failTargets'] = $failTargets
                }

                [pscustomobject]$rule

            } elseif ($ct -eq 'ConditionGroup') {
            # Grouped conditions
            [array] $conditions = @(
                foreach ($Nested in $Entry.Conditions) {
                    if ($Nested.Type -eq 'TableCondition') {
                        New-TablePluginCondition -Condition $Nested.Output
                    }
                }
            )
            $groupUnconditional = ($conditions.Count -eq 0)

                # Determine targets
                $targetNames = if ($Entry.Row) {
                    $Header
                } elseif ($Entry.HighlightHeaders) {
                    $Entry.HighlightHeaders
                } else {
                    @(
                        foreach ($Nested in $Entry.Conditions) {
                            if ($Nested.Type -eq 'TableCondition') { $Nested.Output.Name }
                        }
                    )
                }

                $fill = $null
                if ($Entry.ChildRowFill) {
                    if ($Entry.ChildRowFill -eq 'Parent') { $fill = 'parent' }
                    elseif ($Entry.ChildRowFill -eq 'Both') { $fill = 'both' }
                }
                [array] $targets = @(
                    foreach ($n in $targetNames) {
                        $t = [ordered]@{
                            column = $n
                            css    = $Entry.Style
                        }
                        if ($fill) { $t['fill'] = $fill }
                        $t
                    }
                )

                $failTargets = $null
                if ($Entry.FailStyle.Keys.Count -gt 0) {
                    $failTargets = @(
                        foreach ($n in $targetNames) {
                            [ordered]@{
                                column = $n
                                css    = $Entry.FailStyle
                            }
                        }
                    )
                }

                if ($groupUnconditional) {
                    $rule = [ordered]@{
                        conditionsContainer = @() # unconditional
                        targets             = $targets
                    }
                } else {
                    $rule = [ordered]@{
                        conditionsContainer = @(
                            [ordered]@{
                                logic      = $Entry.Logic
                                conditions = $conditions
                            }
                        )
                        targets             = $targets
                    }
                }
                if ($failTargets) {
                    $rule['failTargets'] = $failTargets
                }

                [pscustomobject]$rule
            }
        }
    )

    return ,$rules
}
