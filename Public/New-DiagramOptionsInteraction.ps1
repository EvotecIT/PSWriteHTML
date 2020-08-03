function New-DiagramOptionsInteraction {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER DragNodes
    Parameter description

    .PARAMETER DragView
    Parameter description

    .PARAMETER HideEdgesOnDrag
    Parameter description

    .PARAMETER HideEdgesOnZoom
    Parameter description

    .PARAMETER HideNodesOnDrag
    Parameter description

    .PARAMETER Hover
    Parameter description

    .PARAMETER HoverConnectedEdges
    Parameter description

    .PARAMETER KeyboardEnabled
    Parameter description

    .PARAMETER KeyboardSpeedX
    Parameter description

    .PARAMETER KeyboardSpeedY
    Parameter description

    .PARAMETER KeyboardSpeedZoom
    Parameter description

    .PARAMETER KeyboardBindToWindow
    Parameter description

    .PARAMETER Multiselect
    Parameter description

    .PARAMETER NavigationButtons
    Parameter description

    .PARAMETER Selectable
    Parameter description

    .PARAMETER SelectConnectedEdges
    Parameter description

    .PARAMETER TooltipDelay
    Parameter description

    .PARAMETER ZoomView
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    Based on options https://visjs.github.io/vis-network/docs/network/interaction.html#

    #>
    [alias('DiagramOptionsInteraction')]
    [CmdletBinding()]
    param(
        [nullable[bool]] $DragNodes,
        [nullable[bool]] $DragView,
        [nullable[bool]] $HideEdgesOnDrag,
        [nullable[bool]] $HideEdgesOnZoom,
        [nullable[bool]] $HideNodesOnDrag,
        [nullable[bool]] $Hover,
        [nullable[bool]] $HoverConnectedEdges,
        [nullable[bool]] $KeyboardEnabled,
        [nullable[int]] $KeyboardSpeedX,
        [nullable[int]] $KeyboardSpeedY,
        [nullable[decimal]] $KeyboardSpeedZoom,
        [nullable[bool]] $KeyboardBindToWindow,
        [nullable[bool]] $Multiselect,
        [nullable[bool]] $NavigationButtons,
        [nullable[bool]] $Selectable,
        [nullable[bool]] $SelectConnectedEdges,
        [nullable[int]] $TooltipDelay,
        [nullable[bool]] $ZoomView
    )

    $Object = [PSCustomObject] @{
        Type     = 'DiagramOptionsInteraction'
        Settings = @{
            interaction = [ordered] @{
                dragNodes            = $DragNodes
                dragView             = $DragView
                hideEdgesOnDrag      = $HideEdgesOnDrag
                hideEdgesOnZoom      = $HideEdgesOnZoom
                hideNodesOnDrag      = $HideNodesOnDrag
                hover                = $Hover
                hoverConnectedEdges  = $HoverConnectedEdges
                keyboard             = @{
                    enabled      = $KeyboardEnabled
                    speed        = @{
                        x    = $KeyboardSpeedX
                        y    = $KeyboardSpeedY
                        zoom = $KeyboardSpeedZoom
                    }
                    bindToWindow = $KeyboardBindToWindow
                }
                multiselect          = $Multiselect
                navigationButtons    = $NavigationButtons
                selectable           = $Selectable
                selectConnectedEdges = $SelectConnectedEdges
                tooltipDelay         = $TooltipDelay
                zoomView             = $ZoomView
            }
        }
    }
    Remove-EmptyValue -Hashtable $Object.Settings -Recursive -Rerun 2
    $Object
}
<#
    var options = {
        nodes: {
          borderWidth:2,
          borderWidthSelected: 8,
          size:24,
          color: {
            border: 'white',
            background: 'black',
            highlight: {
              border: 'black',
              background: 'white'
            },
            hover: {
              border: 'orange',
              background: 'grey'
            }
          },
          font:{color:'#eeeeee'},
          shapeProperties: {
            useBorderWithImage:true
          }
        },
        edges: {
          color: 'lightgray'
        }
      };
    #>


# https://visjs.github.io/vis-network/docs/network/edges.html#