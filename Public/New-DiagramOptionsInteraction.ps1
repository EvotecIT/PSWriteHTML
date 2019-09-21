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
        [bool] $DragNodes = $true,
        [bool] $DragView = $true,
        [bool] $HideEdgesOnDrag = $false,
        [bool] $HideEdgesOnZoom = $false,
        [bool] $HideNodesOnDrag = $false,
        [bool] $Hover = $false,
        [bool] $HoverConnectedEdges = $true,
        [bool] $KeyboardEnabled = $false,
        [int] $KeyboardSpeedX = 10,
        [int] $KeyboardSpeedY = 10,
        [decimal] $KeyboardSpeedZoom = 0.02,
        [bool] $KeyboardBindToWindow = $true,
        [bool] $Multiselect = $false,
        [bool] $NavigationButtons = $false,
        [bool] $Selectable = $true,
        [bool] $SelectConnectedEdges = $true,
        [int] $TooltipDelay = 300,
        [bool] $ZoomView = $true
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