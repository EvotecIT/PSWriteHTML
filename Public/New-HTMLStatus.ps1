function New-HTMLStatus {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][alias('')][ScriptBlock] $Content
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.StatusButtonical = $true
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'buttonicalService' } {
        #New-HTMLTag -Tag 'div' -Attributes @{ class = 'buttonical-align' } {
        Invoke-Command -ScriptBlock $Content
        # }
    }

}