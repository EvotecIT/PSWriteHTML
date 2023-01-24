

$Objects = Import-Csv -LiteralPath "C:\Users\przemyslaw.klys\Downloads\AuditLog_2022-02-06_2022-02-13.csv"
$Objects.COunt

$Test = foreach ($Object in $Objects) {
    $Object.AuditData | ConvertFrom-Json
}
$Test | Out-HtmlView -Filtering -ScrollX -FlattenObject