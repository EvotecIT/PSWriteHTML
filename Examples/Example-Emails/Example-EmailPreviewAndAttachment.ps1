Import-Module (Join-Path $PSScriptRoot '../../PSWriteHTML.psd1') -Force

$Requests = 1..25 | ForEach-Object {
    [pscustomobject]@{
        Ticket = "SR-$_"
        State  = if ($_ % 3 -eq 0) { 'Closed' } else { 'Open' }
    }
}
$ReportPath = Join-Path $PSScriptRoot 'Requests.html'
$Subject = 'Service request summary'

# Generate the attachment separately so it contains all rows and interactive exports.
New-HTML -FilePath $ReportPath -TitleText $Subject {
    New-HTMLTable -DataTable $Requests -Title $Subject {
        New-TableButtonExcel -Title 'Service requests workbook'
        New-TableButtonPDF -Title 'Service requests report'
    }
}

# Generate the preview locally; no mail transport is needed.
$EmailContent = {
    EmailBody {
        EmailText -Text 'The first 10 requests are shown below. The attachment contains the full report.'
        EmailTable -DataTable ($Requests | Select-Object -First 10) -HideFooter
    }
}
$Preview = & $EmailContent
Save-HTML -FilePath (Join-Path $PSScriptRoot 'Requests-preview.html') -HTML $Preview

# To send, supply your mail settings and configured transport. For example:
# Email -From $From -To $To -Server $SmtpServer -Subject $Subject -Attachment $ReportPath -WhatIf $EmailContent
