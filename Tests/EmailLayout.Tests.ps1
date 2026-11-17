BeforeAll {
    Import-Module (Join-Path $PSScriptRoot '../PSWriteHTML.psd1') -Force
}

Describe 'Email layout widths' {
    It 'emits an outer width in HTML and inline CSS: <Case>' -TestCases @(
        @{ Case = 'numeric pixels'; Width = '800'; Attribute = '800'; Css = '800px' }
        @{ Case = 'fractional pixels'; Width = '800.5'; Attribute = '800.5'; Css = '800.5px' }
        @{ Case = 'explicit pixels'; Width = '640px'; Attribute = '640'; Css = '640px' }
        @{ Case = 'percentage'; Width = '75%'; Attribute = '75%'; Css = '75%' }
    ) {
        param($Case, $Width, $Attribute, $Css)
        $Html = EmailBody {
            EmailLayout -Width $Width {
                EmailLayoutColumn { EmailText -Text 'Content' }
            }
        }
        $Tag = [regex]::Match($Html, '<table\b(?=[^>]*\bclass="layoutTable")[^>]*>').Value

        $Tag | Should -Match ('\bwidth="' + [regex]::Escape($Attribute) + '"')
        $Tag | Should -Match ('(?:;|"|\s)width:\s*' + [regex]::Escape($Css) + '(?:;|\s|")')
        $Html | Should -Match 'Content'
    }

    It 'preserves the full-width outer layout when no width is supplied' {
        $Html = EmailBody { EmailLayout { EmailLayoutColumn { EmailText -Text 'Default' } } }
        $Tag = [regex]::Match($Html, '<table\b(?=[^>]*\bclass="layoutTable")[^>]*>').Value

        $Tag | Should -Match '\bwidth="100%"'
        $Tag | Should -Not -Match '(?:;|"|\s)width:'
    }

    It 'emits column widths without losing padding or alignment: <Case>' -TestCases @(
        @{ Case = 'numeric pixels'; Width = '200'; Attribute = '200'; Css = '200px' }
        @{ Case = 'fractional pixels'; Width = '200.5'; Attribute = '200.5'; Css = '200.5px' }
        @{ Case = 'explicit pixels'; Width = '320px'; Attribute = '320'; Css = '320px' }
        @{ Case = 'percentage'; Width = '25%'; Attribute = '25%'; Css = '25%' }
    ) {
        param($Case, $Width, $Attribute, $Css)
        $Html = EmailBody {
            EmailLayout {
                EmailLayoutColumn -Width $Width -Padding 10 -Alignment right { EmailText -Text 'Column content' }
            }
        }
        $Tag = [regex]::Match($Html, '<td\b(?=[^>]*\bclass="layoutTableColumn")[^>]*>').Value

        $Tag | Should -Match ('\bwidth="' + [regex]::Escape($Attribute) + '"')
        $Tag | Should -Match ('(?:;|"|\s)width:\s*' + [regex]::Escape($Css) + '(?:;|\s|")')
        $Tag | Should -Match 'padding:\s*10px'
        $Tag | Should -Match '\balign="right"'
        $Html | Should -Match 'Column content'
    }

    It 'keeps CSS-only units out of legacy HTML width attributes' {
        $Html = EmailBody {
            EmailLayout -Width '40em' {
                EmailLayoutColumn -Width '10em' { EmailText -Text 'Relative width' }
            }
        }
        $Outer = [regex]::Match($Html, '<table\b(?=[^>]*\bclass="layoutTable")[^>]*>').Value
        $Column = [regex]::Match($Html, '<td\b(?=[^>]*\bclass="layoutTableColumn")[^>]*>').Value

        $Outer | Should -Not -Match '\bwidth="'
        $Outer | Should -Match '(?:;|"|\s)width:\s*40em(?:;|\s|")'
        $Column | Should -Not -Match '\bwidth="'
        $Column | Should -Match '(?:;|"|\s)width:\s*10em(?:;|\s|")'
    }
}
