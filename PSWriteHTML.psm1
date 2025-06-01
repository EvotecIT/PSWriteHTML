#Get public and private function definition files.
$Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue -Recurse )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue -Recurse )
$Classes = @( Get-ChildItem -Path $PSScriptRoot\Classes\*.ps1 -ErrorAction SilentlyContinue -Recurse )
$Enums = @( Get-ChildItem -Path $PSScriptRoot\Enums\*.ps1 -ErrorAction SilentlyContinue -Recurse )

$AssemblyFolders = Get-ChildItem -Path $PSScriptRoot\Lib -Directory -ErrorAction SilentlyContinue
if ($AssemblyFolders.BaseName -contains 'Standard') {
    $Assembly = @( Get-ChildItem -Path $PSScriptRoot\Lib\Standard\*.dll -ErrorAction SilentlyContinue )
} else {
    if ($PSEdition -eq 'Core') {
        $Assembly = @( Get-ChildItem -Path $PSScriptRoot\Lib\Core\*.dll -ErrorAction SilentlyContinue )
    } else {
        $Assembly = @( Get-ChildItem -Path $PSScriptRoot\Lib\Default\*.dll -ErrorAction SilentlyContinue )
    }
}
$FoundErrors = @(
    foreach ($Import in @($Assembly)) {
        try {
            Add-Type -Path $Import.Fullname -ErrorAction Stop
        } catch [System.Reflection.ReflectionTypeLoadException] {
            Write-Warning "Processing $($Import.Name) Exception: $($_.Exception.Message)"
            $LoaderExceptions = $($_.Exception.LoaderExceptions) | Sort-Object -Unique
            foreach ($E in $LoaderExceptions) {
                Write-Warning "Processing $($Import.Name) LoaderExceptions: $($E.Message)"
            }
            $true
            #Write-Error -Message "StackTrace: $($_.Exception.StackTrace)"
        } catch {
            Write-Warning "Processing $($Import.Name) Exception: $($_.Exception.Message)"
            $LoaderExceptions = $($_.Exception.LoaderExceptions) | Sort-Object -Unique
            foreach ($E in $LoaderExceptions) {
                Write-Warning "Processing $($Import.Name) LoaderExceptions: $($E.Message)"
            }
            $true
            #Write-Error -Message "StackTrace: $($_.Exception.StackTrace)"
        }
    }
    #Dot source the files
    foreach ($Import in @($Private + $Public + $Classes + $Enums)) {
        try {
            . $Import.Fullname
        } catch {
            Write-Error -Message "Failed to import functions from $($import.Fullname): $_"
            $true
        }
    }
)

if ($FoundErrors.Count -gt 0) {
    $ModuleName = (Get-ChildItem $PSScriptRoot\*.psd1).BaseName
    Write-Warning "Importing module $ModuleName failed. Fix errors before continuing."
    break
}

# Initialize InfoCard Icons Dictionary at module scope
$Script:InfoCardIcons = @{
    # People & Users
    'Users' = '👥'
    'User' = '👤'
    'Admin' = '👨‍💼'
    'Team' = '👨‍👩‍👧‍👦'

    # Security
    'Lock' = '🔒'
    'Unlock' = '🔓'
    'Key' = '🔑'
    'Shield' = '🛡️'
    'Security' = '🔐'

    # Status & Alerts
    'Success' = '✅'
    'Warning' = '⚠️'
    'Error' = '❌'
    'Info' = 'ℹ️'
    'Check' = '✓'

    # Numbers & Analytics
    'Chart' = '📊'
    'Graph' = '📈'
    'Trending' = '📈'
    'Report' = '📋'
    'Analytics' = '📊'

    # Business
    'Money' = '💰'
    'Sales' = '💰'
    'Revenue' = '💵'
    'Profit' = '💹'

    # Technology
    'Server' = '🖥️'
    'Database' = '🗄️'
    'Cloud' = '☁️'
    'Network' = '🔌'
    'Api' = '🔗'
    'Code' = '💻'
    'Bug' = '🐛'
    'Settings' = '⚙️'

    # Communication
    'Email' = '📧'
    'Message' = '💬'
    'Phone' = '📞'
    'Alert' = '🔔'

    # Time & Activity
    'Clock' = '🕐'
    'Calendar' = '📅'
    'Timer' = '⏱️'
    'History' = '📜'

    # Actions
    'Download' = '⬇️'
    'Upload' = '⬆️'
    'Sync' = '🔄'
    'Backup' = '💾'
    'Archive' = '📦'

    # Status Indicators
    'Online' = '🟢'
    'Offline' = '🔴'
    'Pending' = '🟡'
    'Processing' = '🔄'
}

Export-ModuleMember -Function '*' -Alias '*'