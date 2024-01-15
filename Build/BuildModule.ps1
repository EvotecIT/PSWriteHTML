Invoke-ModuleBuild -ModuleName 'PSWriteHTML' {
    # Usual defaults as per standard module
    $Manifest = [ordered] @{
        ModuleVersion        = '1.X.0'
        CompatiblePSEditions = @('Desktop', 'Core')
        GUID                 = 'a7bdf640-f5cb-4acf-9de0-365b322d245c'
        Author               = 'Przemyslaw Klys'
        CompanyName          = 'Evotec'
        Copyright            = "(c) 2011 - $((Get-Date).Year) Przemyslaw Klys @ Evotec. All rights reserved."
        Description          = 'PSWriteHTML is PowerShell Module to generate beautiful HTML reports, pages, emails without any knowledge of HTML, CSS or JavaScript. To get started basics PowerShell knowledge is required.'
        PowerShellVersion    = '5.1'
        Tags                 = @('HTML', 'WWW', 'JavaScript', 'CSS', 'Reports', 'Reporting', 'Windows', 'MacOS', 'Linux')
        IconUri              = 'https://evotec.xyz/wp-content/uploads/2018/12/PSWriteHTML.png'
        ProjectUri           = 'https://github.com/EvotecIT/PSWriteHTML'
        #DotNetFrameworkVersion = '4.5.2'
    }
    New-ConfigurationManifest @Manifest #-Prerelease "Alpha02"

    New-ConfigurationModule -Type RequiredModule -Name 'PSSharedGoods' -Guid Auto -Version Latest
    #New-ConfigurationModule -Type ExternalModule -Name 'Microsoft.PowerShell.Utility', 'Microsoft.PowerShell.Management','Microsoft.PowerShell.Security'
    New-ConfigurationModule -Type ApprovedModule -Name 'PSSharedGoods', 'PSWriteColor', 'Connectimo', 'PSUnifi', 'PSWebToolbox', 'PSMyPassword'

    New-ConfigurationModuleSkip -IgnoreModuleName @(
        # this are builtin into PowerShell, so not critical
        'Microsoft.PowerShell.Management'
        'Microsoft.PowerShell.Security'
        'Microsoft.PowerShell.Utility'
        # this is optional, and checked for existance in the source codes directly
        'PSParseHTML'
    ) -IgnoreFunctionName 'Select-Unique', 'Compare-TwoArrays', 'IsNumeric', 'IsOfType' # those functions are internal within private function

    $ConfigurationFormat = [ordered] @{
        RemoveComments                              = $true
        RemoveEmptyLines                            = $true

        PlaceOpenBraceEnable                        = $true
        PlaceOpenBraceOnSameLine                    = $true
        PlaceOpenBraceNewLineAfter                  = $true
        PlaceOpenBraceIgnoreOneLineBlock            = $false

        PlaceCloseBraceEnable                       = $true
        PlaceCloseBraceNewLineAfter                 = $false
        PlaceCloseBraceIgnoreOneLineBlock           = $true
        PlaceCloseBraceNoEmptyLineBefore            = $false

        UseConsistentIndentationEnable              = $true
        UseConsistentIndentationKind                = 'space'
        UseConsistentIndentationPipelineIndentation = 'IncreaseIndentationAfterEveryPipeline'
        UseConsistentIndentationIndentationSize     = 4

        UseConsistentWhitespaceEnable               = $true
        UseConsistentWhitespaceCheckInnerBrace      = $true
        UseConsistentWhitespaceCheckOpenBrace       = $true
        UseConsistentWhitespaceCheckOpenParen       = $true
        UseConsistentWhitespaceCheckOperator        = $true
        UseConsistentWhitespaceCheckPipe            = $true
        UseConsistentWhitespaceCheckSeparator       = $true

        AlignAssignmentStatementEnable              = $true
        AlignAssignmentStatementCheckHashtable      = $true

        UseCorrectCasingEnable                      = $true
    }
    # format PSD1 and PSM1 files when merging into a single file
    # enable formatting is not required as Configuration is provided
    New-ConfigurationFormat -ApplyTo 'OnMergePSM1', 'OnMergePSD1' -Sort None @ConfigurationFormat
    # format PSD1 and PSM1 files within the module
    # enable formatting is required to make sure that formatting is applied (with default settings)
    New-ConfigurationFormat -ApplyTo 'DefaultPSD1', 'DefaultPSM1' -EnableFormatting -Sort None
    # when creating PSD1 use special style without comments and with only required parameters
    New-ConfigurationFormat -ApplyTo 'DefaultPSD1', 'OnMergePSD1' -PSD1Style 'Minimal'
    # configuration for documentation, at the same time it enables documentation processing
    New-ConfigurationDocumentation -Enable:$false -StartClean -UpdateWhenNew -PathReadme 'Docs\Readme.md' -Path 'Docs'

    New-ConfigurationImportModule -ImportSelf

    New-ConfigurationBuild -Enable:$true -SignModule -MergeModuleOnBuild -MergeFunctionsFromApprovedModules -CertificateThumbprint '483292C9E317AA13B07BB7A96AE9D1A5ED9E7703'

    New-ConfigurationTest -TestsPath "$PSScriptRoot\..\Tests" -Enable

    New-ConfigurationArtefact -Type Unpacked -Enable -Path "$PSScriptRoot\..\Artefacts\Unpacked" -AddRequiredModules
    New-ConfigurationArtefact -Type Packed -Enable -Path "$PSScriptRoot\..\Artefacts\Packed" -ArtefactName '<ModuleName>.v<ModuleVersion>.zip'

    # options for publishing to github/psgallery
    #New-ConfigurationPublish -Type PowerShellGallery -FilePath 'C:\Support\Important\PowerShellGalleryAPI.txt' -Enabled:$true
    #New-ConfigurationPublish -Type GitHub -FilePath 'C:\Support\Important\GitHubAPI.txt' -UserName 'EvotecIT' -Enabled:$true
} -ExitCode