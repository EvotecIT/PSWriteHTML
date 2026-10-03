BeforeAll {
    Import-Module (Join-Path $PSScriptRoot '../PSWriteHTML.psd1') -Force
}

Describe 'Report data and script boundaries' {
    It 'preserves arrays, dates and values in caller objects across repeated table rendering' {
        $Row = [PSCustomObject]@{ Name = 'Server'; Items = @('One', 'Two'); Date = [DateTime]'2026-10-03' }
        $null = New-HTML -Online {
            New-HTMLTableOption -ArrayJoin -DateTimeFormat 'yyyy-MM-dd'
            New-HTMLTable -DataTable $Row -HideButtons
            New-HTMLTable -DataTable $Row -HideButtons
        }
        $Row.Items.GetType().FullName | Should -Be 'System.Object[]'
        $Row.Items.Count | Should -Be 2
        $Row.Date | Should -BeOfType [DateTime]
        $Row.Date | Should -Be ([DateTime]'2026-10-03')
    }

    It 'round-trips script data, including one-element arrays and multiple pipeline records' {
        InModuleScope PSWriteHTML {
            $Value = "C:\new\temp`nquoted `"text`" '</script>'" + [char]0x2028
            $Json = ConvertTo-HTMLScriptJson -InputObject @($Value) -Compress
            $Json.StartsWith('[') | Should -BeTrue
            ($Json | ConvertFrom-Json) | Should -Be $Value
            $Json | Should -Not -Match '</script>'
            $Many = @([PSCustomObject]@{ Name = 'One' }, [PSCustomObject]@{ Name = 'Two' }) | ConvertTo-HTMLScriptJson
            ($Many | ConvertFrom-Json).Count | Should -Be 2
        }
    }

    It 'uses one valid JSON string for multiline Markdown with backslashes and closing script text' {
        $Text = "C:\new\temp`nSecond 'line' </script>"
        $Html = New-HTML -Online { New-HTMLMarkdown -Content $Text -SanitezeHTML }
        $Match = [regex]::Match($Html, 'let text\w+ = (.+);')
        $Match.Success | Should -BeTrue
        ($Match.Groups[1].Value | ConvertFrom-Json) | Should -Be ($Text + "`n")
    }

    It 'evaluates hidden helper columns and preserves visible-column highlighting in email tables' {
        $Rows = @([PSCustomObject]@{ Name = 'Bad server'; Status = 'Bad' }, [PSCustomObject]@{ Name = 'Good server'; Status = 'Good' })
        $Html = EmailBody {
            New-HTMLTable -DataTable $Rows -ExcludeProperty Status {
                New-TableCondition -Name Status -Value Bad -Operator eq -BackgroundColor Red -Row -Inline
            }
        }
        $Html | Should -Match '<td style="background-color:#ff0000">Bad server</td>'
        $Html | Should -Match '<td>Good server</td>'
        $Html | Should -Not -Match '<th>Status</th>'
    }

    It 'compares decoded text and native dates without changing the displayed values' {
        $Rows = @([PSCustomObject]@{ Name = 'A & B'; Date = [DateTime]'2026-10-03'; Status = 'Good' })
        $Html = EmailBody {
            New-HTMLTableOption -DateTimeFormat 'yyyy-MM-dd'
            New-HTMLTable -DataTable $Rows -ExcludeProperty Status {
                New-TableCondition -Name Name -Value 'A & B' -Operator eq -BackgroundColor Red -Inline
                New-TableCondition -Name Date -Value ([DateTime]'2026-10-03') -ComparisonType date -Operator eq -BackgroundColor Blue -Inline
            }
        }
        $Html | Should -Match '<td style="background-color:#ff0000">A &amp; B</td>'
        $Html | Should -Match '<td style="background-color:#0000ff">2026-10-03</td>'
    }

    It 'keeps helper fields aligned when preceding source values are arrays' {
        $Row = [PSCustomObject]@{ Name = 'Server'; Items = @('One', 'Two'); Status = 'Bad' }
        $Html = EmailBody {
            New-HTMLTableOption -ArrayJoin
            New-HTMLTable -DataTable $Row -ExcludeProperty Status {
                New-TableCondition -Name Status -Value Bad -Operator eq -BackgroundColor Red -Row -Inline
            }
        }
        $Html | Should -Match '<td style="background-color:#ff0000">Server</td>'
        $Html | Should -Match '<td style="background-color:#ff0000">One, Two</td>'
    }
}

Describe 'Portable content and column presentation' {
    It 'parses parenthesized labels and nested URL parentheses without modifying the input array' {
        $Text = @('[Label (RODCs)](https://example.com/a_(b_(c)))', '[Other](https://example.com/)')
        $Html = New-HTML -Online { New-HTMLText -Text $Text }
        $Html | Should -Match 'href="https://example.com/a_\(b_\(c\)\)">Label \(RODCs\)</a>'
        $Text[0] | Should -Be '[Label (RODCs)](https://example.com/a_(b_(c)))'
    }

    It 'embeds local Markdown images from the source directory and retains the opt-out' {
        $Source = Join-Path $TestDrive 'markdown'
        $null = New-Item -ItemType Directory -Path (Join-Path $Source 'images')
        [IO.File]::WriteAllBytes((Join-Path $Source 'images/pixel.png'), [Convert]::FromBase64String('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+j/XcAAAAASUVORK5CYII='))
        $File = Join-Path $Source 'sample.md'
        '![local](images/pixel.png)' | Set-Content -LiteralPath $File
        $Embedded = New-HTML -Online { New-HTMLMarkdown -FilePath $File }
        $Embedded | Should -Match 'data:image/png;base64,'
        $Linked = New-HTML -Online { New-HTMLMarkdown -FilePath $File -EmbedImages $false }
        $Linked | Should -Match 'images/pixel.png'
    }

    It 'does not embed files outside the Markdown image source directory' {
        $Source = Join-Path $TestDrive 'contained'
        $null = New-Item -ItemType Directory -Path $Source
        [IO.File]::WriteAllBytes((Join-Path $TestDrive 'outside.png'), [byte[]]@(1, 2, 3))
        $Html = New-HTML -Online { New-HTMLMarkdown -Content '![outside](../outside.png)' -ImageBase $Source }
        $Html | Should -Not -Match 'data:image/'
    }

    It 'leaves non-image files and ordinary link references untouched' {
        $Source = Join-Path $TestDrive 'references'
        $null = New-Item -ItemType Directory -Path $Source
        'private text' | Set-Content -LiteralPath (Join-Path $Source 'secret.txt')
        [IO.File]::WriteAllBytes((Join-Path $Source 'pixel.png'), [Convert]::FromBase64String('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+j/XcAAAAASUVORK5CYII='))
        $Content = "![text](secret.txt)`n[ordinary link][download]`n[download]: pixel.png`n![image][photo]`n[photo]: pixel.png"
        $Html = New-HTML -Online { New-HTMLMarkdown -Content $Content -ImageBase $Source }
        $Html | Should -Match '\[download\]: pixel.png'
        $Html | Should -Match 'secret.txt'
        $Html | Should -Match '\[photo\]: data:image/png;base64,'
    }

    It 'styles merged titles and column names independently' {
        $Html = New-HTML -Online {
            New-HTMLTable -DataTable ([PSCustomObject]@{ Name = 'One'; Value = 1 }) -HideButtons {
                New-TableHeader -Names Name, Value -Title 'Details' -TitleAlignment center -NamesAlignment right
            }
        }
        $Html | Should -Match '<th[^>]*text-align:center[^>]*>Details</th>'
        $Html | Should -Match '<th style="text-align:right">Name</th>'
        $Html | Should -Match '<th style="text-align:right">Value</th>'
    }
}
