function EmailBody {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $EmailBody,
        [string] $Color,
        [string] $BackGroundColor,
        [string] $LineHeight,
        [alias('Size')][object] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily ,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [ValidateSet('rtl')][string] $Direction,
        [switch] $Online,
        [switch] $Format,
        [switch] $Minify
    )

    $newHTMLSplat = @{}
    if ($Alignment) {
        $newHTMLSplat.Alignment = $Alignment
    }
    if ($FontSize) {
        $newHTMLSplat.FontSize = $FontSize
    }
    if ($TextTransform) {
        $newHTMLSplat.TextTransform = $TextTransform
    }
    if ($Color) {
        $newHTMLSplat.Color = $Color
    }
    if ($FontFamily) {
        $newHTMLSplat.FontFamily = $FontFamily
    }
    if ($Direction) {
        $newHTMLSplat.Direction = $Direction
    }
    if ($FontStyle) {
        $newHTMLSplat.FontStyle = $FontStyle
    }
    if ($TextDecoration) {
        $newHTMLSplat.TextDecoration = $TextDecoration
    }
    if ($BackGroundColor) {
        $newHTMLSplat.BackGroundColor = $BackGroundColor
    }
    if ($FontVariant) {
        $newHTMLSplat.FontVariant = $FontVariant
    }
    if ($FontWeight) {
        $newHTMLSplat.FontWeight = $FontWeight
    }
    $newHTMLSplat.LineHeight = $LineHeight
    if ($newHTMLSplat.Count -gt 0) {
        $SpanRequired = $true
    } else {
        $SpanRequired = $false
    }
    # This is used if Email is used and someone would set Online switch there.
    # Since we moved New-HTML here - we need to do some workaround
    if (-not $Online) {
        if ($Script:EmailSchema['Online']) {
            $HTMLOnline = $true
        } else {
            $HTMLOnline = $false
        }
    } else {
        $HTMLOnline = $true
    }


    $Body = New-HTML -Online:$HTMLOnline {
        # Email is special and we want margins to be 0px
        $Script:HTMLSchema['Email'] = $true
        #$Script:CurrentConfiguration['Features']['Main']['HeaderAlways']['CssInLine']['body']['margin'] = '0px'
        $Script:CurrentConfiguration['Features']['DefaultImage']['HeaderAlways']['CssInLine']['.logo']['margin'] = '0px'
        $Script:CurrentConfiguration['Features']['DefaultHeadings']['HeaderAlways']['CssInLine']['h1']['margin'] = '0px'
        $Script:CurrentConfiguration['Features']['DefaultHeadings']['HeaderAlways']['CssInLine']['h2']['margin'] = '0px'
        $Script:CurrentConfiguration['Features']['DefaultHeadings']['HeaderAlways']['CssInLine']['h3']['margin'] = '0px'
        $Script:CurrentConfiguration['Features']['DefaultHeadings']['HeaderAlways']['CssInLine']['h4']['margin'] = '0px'
        $Script:CurrentConfiguration['Features']['DefaultHeadings']['HeaderAlways']['CssInLine']['h5']['margin'] = '0px'
        $Script:CurrentConfiguration['Features']['DefaultHeadings']['HeaderAlways']['CssInLine']['h6']['margin'] = '0px'
        $Script:CurrentConfiguration['Features']['DefaultText']['HeaderAlways']['CssInLine']['.defaultText']['margin'] = '0px'
        $Script:CurrentConfiguration['Features']['DataTables']['HeaderAlways']['CssInLine']['div.dataTables_wrapper']['margin'] = '0px'
        $Script:CurrentConfiguration['Features']['DataTables']['HeaderAlways']['CssInLine']['div.dataTables_wrapper']['margin'] = '0px'
        if ($SpanRequired) {
            New-HTMLSpanStyle @newHTMLSplat {
                Invoke-Command -ScriptBlock $EmailBody
            }
        } else {
            Invoke-Command -ScriptBlock $EmailBody
        }
    } -Format:$Format -Minify:$Minify
    # This section makes sure that if any script is present in HTML it will be removed.
    # Our goal here is to make HTML in EMAIL as small as possible without added junk which won't be read anyways
    # https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.regexoptions?view=net-5.0
    $options = [Text.RegularExpressions.RegexOptions] 'Singleline,IgnoreCase' #, CultureInvariant'
    $OutputToCheck = [Regex]::Matches($Body, '(?<=<script)(.*?)(?=<\/script>)', $options) | Select-Object -ExpandProperty Value
    foreach ($Script in $OutputToCheck) {
        $Body = $Body.Replace("<script$Script</script>", '')
    }

    if ($Script:EmailSchema['AttachSelf']) {
        # if attach self is used we will generate better version with JS present, proper margins and so on
        $AttachSelfBody = New-HTML -Online:$HTMLOnline {
            if ($SpanRequired) {
                New-HTMLSpanStyle @newHTMLSplat {
                    Invoke-Command -ScriptBlock $EmailBody
                }
            } else {
                Invoke-Command -ScriptBlock $EmailBody
            }
        } -Format:$Format -Minify:$Minify

        @{
            Body           = $Body
            AttachSelfBody = $AttachSelfBody
        }
    } else {
        # if attach self is not used we need only one version of code
        $Body
    }

}

Register-ArgumentCompleter -CommandName EmailBody -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName EmailBody -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors