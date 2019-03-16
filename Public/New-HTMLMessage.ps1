function New-HTMLMessage {
    param(
        [Parameter(Mandatory = $false, Position = 0)][alias('')][ScriptBlock] $Content,
        $Text
    )
    $Script:HTMLSchema.Features.Message = $true
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'message green' } {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'message-icon' } {
            New-HTMLTag -Tag 'i' -Attributes @{ class = 'fa fa-bell-o'} 
        }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'message-body' } {
            New-HTMLTag -Tag 'p' -Attributes @{ class = '' } {
                $Text
            }
        }
    }
}