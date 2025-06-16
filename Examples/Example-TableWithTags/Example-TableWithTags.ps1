Import-Module .\PSWriteHTML.psd1 -Force

$test = "<test>"
New-HTML {
    New-HTMLTableOption -DataStore JavaScript -BoolAsString -ArrayJoinString '<br>' -ArrayJoin

    New-HTMLTab -Name 'Forest' {
        New-HTMLSection -HeaderText 'Summary' {
            New-HTMLTable -DataTable $test
        }
    }
} -ShowHTML -FilePath "$PSScriptRoot\Example-TableWithTags.html" -Online
