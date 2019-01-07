function Add-HTMLSection {
    param(
        [switch] $Open,
        [switch] $Close,
        [switch] $Table,
        [switch] $TableBody,
        [switch] $TableRow,
        [switch] $TableColumn
    )

    $HTML = New-GenericList -Type [string]

    if ($Open) {
        if ($Table) {
            $HTML.Add('<table boarder="1">')
        }
        if ($TableBody) {
            $HTML.Add('<tbody>')
        }
        if ($TableRow) {
            $HTML.Add('<tr>')
        }
        if ($TableColumn) {
            $HTML.Add('<td class="logo">')
        }
    }

    if ($Close) {
        if ($TableColumn) {
            $HTML.Add('</td>')
        }
        if ($TableRow) {
            $HTML.Add('</tr>')
        }
        if ($TableBody) {
            $HTML.Add('</tbody>')
        }
        if ($Table) {
            $HTML.Add('</table>')
        }

    }
    return $HTML
}