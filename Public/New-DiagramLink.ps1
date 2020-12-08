function New-DiagramLink {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER From
    Parameter description

    .PARAMETER To
    Parameter description

    .PARAMETER Label
    Parameter description

    .PARAMETER ArrowsToEnabled
    Parameter description

    .PARAMETER ArrowsToScaleFacto
    Parameter description

    .PARAMETER ArrowsToType
    Parameter description

    .PARAMETER ArrowsMiddleEnabled
    Parameter description

    .PARAMETER ArrowsMiddleScaleFactor
    Parameter description

    .PARAMETER ArrowsMiddleType
    Parameter description

    .PARAMETER ArrowsFromEnabled
    Parameter description

    .PARAMETER ArrowsFromScaleFactor
    Parameter description

    .PARAMETER ArrowsFromType
    Parameter description

    .PARAMETER ArrowStrikethrough
    Parameter description

    .PARAMETER Chosen
    Parameter description

    .PARAMETER Color
    Parameter description

    .PARAMETER ColorHighlight
    Parameter description

    .PARAMETER ColorHover
    Parameter description

    .PARAMETER ColorInherit
    Parameter description

    .PARAMETER ColorOpacity
    Parameter description

    .PARAMETER Dashes
    Parameter description

    .PARAMETER Length
    Parameter description

    .PARAMETER FontColor
    Parameter description

    .PARAMETER FontSize
    Parameter description

    .PARAMETER FontName
    Parameter description

    .PARAMETER FontBackground
    Parameter description

    .PARAMETER FontStrokeWidth
    Parameter description

    .PARAMETER FontStrokeColor
    Parameter description

    .PARAMETER FontAlign
    Possible options: 'horizontal','top','middle','bottom'.
    The alignment determines how the label is aligned over the edge.
    The default value horizontal aligns the label horizontally, regardless of the orientation of the edge.
    When an option other than horizontal is chosen, the label will align itself according to the edge.

    .PARAMETER FontMulti
    Parameter description

    .PARAMETER FontVAdjust
    Parameter description

    .PARAMETER WidthConstraint
    Parameter description

    .PARAMETER SmoothType
    Possible options: 'dynamic', 'continuous', 'discrete', 'diagonalCross', 'straightCross', 'horizontal', 'vertical', 'curvedCW', 'curvedCCW', 'cubicBezier'.
    Take a look at this example to see what these look like and pick the one that you like best! When using dynamic, the edges will have an invisible support node guiding the shape.
    This node is part of the physics simulation.

    .PARAMETER SmoothForceDirection
    Accepted options: ['horizontal', 'vertical', 'none'].
    This options is only used with the cubicBezier curves.
    When true, horizontal is chosen, when false, the direction that is larger (x distance between nodes vs y distance between nodes) is used.
    If the x distance is larger, horizontal. This is ment to be used with hierarchical layouts.

    .PARAMETER SmoothRoundness
    Accepted range: 0 .. 1.0. This parameter tweaks the roundness of the smooth curves for all types EXCEPT dynamic.

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
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
        [ValidateSet('horizontal', 'top', 'middle', 'bottom')][string] $FontAlign,
        [ValidateSet('false', 'true', 'markdown', 'html')][string]$FontMulti,
        [nullable[int]] $FontVAdjust,
        [nullable[int]] $WidthConstraint,

        [ValidateSet('dynamic', 'continuous', 'discrete', 'diagonalCross', 'straightCross', 'horizontal', 'vertical', 'curvedCW', 'curvedCCW', 'cubicBezier')][string] $SmoothType,
        [ValidateSet('horizontal', 'vertical', 'none')][string] $SmoothForceDirection,
        [string] $SmoothRoundness
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
    if ($SmoothType -or $SmoothRoundness -or $SmoothForceDirection) {
        $Object.Edges['smooth'] = @{
            'enabled' = $true
        }
        if ($SmoothType) {
            $Object.Edges['smooth']['type'] = $SmoothType
        }
        if ($SmoothRoundness -ne '') {
            $Object.Edges['smooth']['roundness'] = $SmoothRoundness
        }
        if ($SmoothForceDirection) {
            $Object.Edges['smooth']['forceDirection'] = $SmoothForceDirection
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