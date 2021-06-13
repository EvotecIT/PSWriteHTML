function Add-ParametersToScriptBlock {
    <#
    .SYNOPSIS
    Adds parameters to scriptblock providing ability to define scriptblock in different place and simply provide parameters later on

    .DESCRIPTION
    Adds parameters to scriptblock providing ability to define scriptblock in different place and simply provide parameters later on

    .PARAMETER ScriptBlock
    ScriptBlock to modify

    .PARAMETER Parameter
    Hashtable of parameters/values to add into scriptblock

    .EXAMPLE
    $TemplatePreExpiry  = {
        EmailImage -Source "https://evotec.xyz/wp-content/uploads/2015/05/Logo-evotec-012.png" -Height 50 -Width 200

        EmailText -Text "Hello ", "$DisplayName" -LineBreak
        EmailText -Text "Your password is due to expire in $DaysToExpire days. You last changed password $PasswordLastSet"

        EmailText -Text "To change your password:"
        EmailList {
            EmailListItem "press CTRL+ALT+DEL -> Change a password.."
        }

        EmailText -Text "If you have forgotten you password and need to reset it, you can do this by [visiting password change website](https://evotec.xyz)"
        EmailText -Text "In case of problems please contact HelpDesk by [visting website](https://evotec.xyz) or by sending an email to servicedesk@evotec.pl."

        EmailText -Text @(
            "Alternatively you can always call Service Desk at ", "+48 22 600 20 20"

            "Kind regards,"
            "Evotec IT"
        )
    }

    Add-ParametersToScriptBlock -ScriptBlock $TemplatePreExpiry -Parameter $Parameter

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param(
        [scriptblock] $ScriptBlock,
        [System.Collections.IDictionary] $Parameter
    )

    if ($ScriptBlock) {
        if ($Parameter) {
            $Count = 0
            [string] $ScriptBlockParams = @(
                "param("
                foreach ($Key in $Parameter.Keys) {
                    $Count++
                    if ($Count -eq $Parameter.Keys.Count) {
                        "`$$($Key)"
                    } else {
                        "`$$($Key),"
                    }
                }
                ")"
                $ScriptBlock.ToString()
            )
            $ScriptBlockScript = [scriptblock]::Create($ScriptBlockParams)
            $ScriptBlockScript
        } else {
            $ScriptBlock
        }
    }
}