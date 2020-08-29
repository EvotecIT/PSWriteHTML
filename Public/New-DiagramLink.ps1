function New-DiagramLink {
    [alias('DiagramEdge', 'DiagramEdges', 'New-DiagramEdge', 'DiagramLink')]
    [CmdletBinding()]
    param(
        [string[]] $From,
        [string[]] $To,
        [string] $Label,
        [switch] $ArrowsToEnabled,
        [nullable[int]] $ArrowsToScaleFacto,
        [ValidateSet('arrow', 'bar', 'circle')][string] $ArrowsToType,
        [switch] $ArrowsMiddleEnabled,
        [nullable[int]]$ArrowsMiddleScaleFactor,
        [ValidateSet('arrow', 'bar', 'circle')][string] $ArrowsMiddleType,
        [switch] $ArrowsFromEnabled,
        [nullable[int]] $ArrowsFromScaleFactor,
        [ValidateSet('arrow', 'bar', 'circle')][string] $ArrowsFromType,
        [switch] $ArrowStrikethrough,
        [switch] $Chosen,
        [string] $Color,
        [string] $ColorHighlight,
        [string] $ColorHover,
        [ValidateSet('true', 'false', 'from', 'to', 'both')][string]$ColorInherit,
        [nullable[double]] $ColorOpacity, # range between 0 and 1
        [switch] $Dashes,
        [string] $Length,
        [string] $FontColor,
        [object] $FontSize,
        [string] $FontName,
        [string] $FontBackground,
        [object] $FontStrokeWidth, #// px
        [string] $FontStrokeColor,
        [ValidateSet('center', 'left')][string] $FontAlign,
        [ValidateSet('false', 'true', 'markdown', 'html')][string]$FontMulti,
        [nullable[int]] $FontVAdjust,
        [nullable[int]] $WidthConstraint
    )
    $Object = [PSCustomObject] @{
        Type     = 'DiagramLink'
        Settings = @{
            from = $From
            to   = $To
        }
        Edges    = @{
            label              = $Label
            length             = $Length
            arrows             = [ordered]@{
                to     = [ordered]@{
                    enabled     = if ($ArrowsToEnabled) { $ArrowsToEnabled.IsPresent } else { $null }
                    scaleFactor = $ArrowsToScaleFactor
                    type        = $ArrowsToType
                }
                middle = [ordered]@{
                    enabled     = if ($ArrowsMiddleEnabled) { $ArrowsMiddleEnabled.IsPresent } else { $null }
                    scaleFactor = $ArrowsMiddleScaleFactor
                    type        = $ArrowsMiddleType
                }
                from   = [ordered]@{
                    enabled     = if ($ArrowsFromEnabled) { $ArrowsFromEnabled.IsPresent } else { $null }
                    scaleFactor = $ArrowsFromScaleFactor
                    type        = $ArrowsFromType
                }
            }
            arrowStrikethrough = if ($ArrowStrikethrough) { $ArrowStrikethrough.IsPresent } else { $null }
            chosen             = if ($Chosen) { $Chosen.IsPresent } else { $null }
            color              = [ordered]@{
                color     = ConvertFrom-Color -Color $Color
                highlight = ConvertFrom-Color -Color $ColorHighlight
                hover     = ConvertFrom-Color -Color $ColorHover
                inherit   = $ColorInherit
                opacity   = $ColorOpacity
            }
            font               = [ordered]@{
                color       = ConvertFrom-Color -Color $FontColor
                size        = ConvertFrom-Size -Size $FontSize
                face        = $FontName
                background  = ConvertFrom-Color -Color $FontBackground
                strokeWidth = ConvertFrom-Size -Size $FontStrokeWidth
                strokeColor = ConvertFrom-Color -Color $FontStrokeColor
                align       = $FontAlign
                multi       = $FontMulti
                vadjust     = $FontVAdjust
            }
            dashes             = if ($Dashes) { $Dashes.IsPresent } else { $null }
            widthConstraint    = $WidthConstraint
        }
    }
    Remove-EmptyValue -Hashtable $Object.Settings -Recursive
    Remove-EmptyValue -Hashtable $Object.Edges -Recursive -Rerun 2
    $Object
}
Register-ArgumentCompleter -CommandName New-DiagramLink -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramLink -ParameterName ColorHighlight -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramLink -ParameterName ColorHover -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramLink -ParameterName FontColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramLink -ParameterName FontBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramLink -ParameterName FontStrokeColor -ScriptBlock $Script:ScriptBlockColors

<#
  // these are all options in full.
  var options = {
    edges:{
      arrows: {
        to:     {enabled: false, scaleFactor:1, type:'arrow'},
        middle: {enabled: false, scaleFactor:1, type:'arrow'},
        from:   {enabled: false, scaleFactor:1, type:'arrow'}
      },
      arrowStrikethrough: true,
      chosen: true,
      color: {
        color:'#848484',
        highlight:'#848484',
        hover: '#848484',
        inherit: 'from',
        opacity:1.0
      },
      dashes: false,
      font: {
        color: '#343434',
        size: 14, // px
        face: 'arial',
        background: 'none',
        strokeWidth: 2, // px
        strokeColor: '#ffffff',
        align: 'horizontal',
        multi: false,
        vadjust: 0,
        bold: {
          color: '#343434',
          size: 14, // px
          face: 'arial',
          vadjust: 0,
          mod: 'bold'
        },
        ital: {
          color: '#343434',
          size: 14, // px
          face: 'arial',
          vadjust: 0,
          mod: 'italic',
        },
        boldital: {
          color: '#343434',
          size: 14, // px
          face: 'arial',
          vadjust: 0,
          mod: 'bold italic'
        },
        mono: {
          color: '#343434',
          size: 15, // px
          face: 'courier new',
          vadjust: 2,
          mod: ''
        }
      },
      hidden: false,
      hoverWidth: 1.5,
      label: undefined,
      labelHighlightBold: true,
      length: undefined,
      physics: true,
      scaling:{
        min: 1,
        max: 15,
        label: {
          enabled: true,
          min: 14,
          max: 30,
          maxVisible: 30,
          drawThreshold: 5
        },
        customScalingFunction: function (min,max,total,value) {
          if (max === min) {
            return 0.5;
          }
          else {
            var scale = 1 / (max - min);
            return Math.max(0,(value - min)*scale);
          }
        }
      },
      selectionWidth: 1,
      selfReferenceSize:20,
      shadow:{
        enabled: false,
        color: 'rgba(0,0,0,0.5)',
        size:10,
        x:5,
        y:5
      },
      smooth: {
        enabled: true,
        type: "dynamic",
        roundness: 0.5
      },
      title:undefined,
      value: undefined,
      width: 1,
      widthConstraint: false
    }
  }

  network.setOptions(options);
  #>