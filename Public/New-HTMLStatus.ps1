function New-HTMLStatus {
    <#
    .SYNOPSIS
    Creates a new HTML status section with customizable content.

    .DESCRIPTION
    The New-HTMLStatus function creates an HTML status section with customizable content. It allows you to display status information with flexibility.

    .PARAMETER Content
    Specifies the content to be displayed within the status section as a ScriptBlock.

    .EXAMPLE
    New-HTMLStatus -Content {
        "Status: OK"
    }
    Creates a new HTML status section displaying "Status: OK".

    .EXAMPLE
    $content = {
        "Status: Error"
    }
    New-HTMLStatus -Content $content
    Creates a new HTML status section displaying "Status: Error".
    #>
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