$Users = Get-ADUser -Filter * -Properties LastLogonDate, PasswordLastSet | Select-Object -First 3
New-HTML {
    New-HTMLTable -DataTable $Users -Title 'Table with Users' -HideFooter -PagingLength 10 {
        $DateGreaterLogon = (Get-Date -Year 2019 -Month 1 -Day 1)
        $PasswordLastSet = (Get-Date -Year 2020 -Month 1 -Day 1)
        New-TableConditionGroup -Logic AND {
            New-TableCondition -Name 'LastLogonDate' -ComparisonType date -DateTimeFormat 'DD.MM.YYYY HH:mm:ss' -Operator gt -Value $DateGreaterLogon
            New-TableCondition -Name 'PasswordLastSet' -ComparisonType date -DateTimeFormat 'DD.MM.YYYY HH:mm:ss' -Operator gt -Value $PasswordLastSet
        } -TextDecoration underline -Color White -BackgroundColor SeaGreen -HighlightHeaders LastLogonDate, ObjectGUID, ObjectClass
    } -DateTimeSortingFormat 'DD.MM.YYYY HH:mm:ss', 'M/D/YYYY', 'YYYY-MM-DD'
} -ShowHTML -FilePath "$PSScriptRoot\Example-TableConditions.html" -Online 