function New-DiagramOptionsInteraction {
    <#
    .SYNOPSIS
    Creates a new diagram options interaction object with customizable options.

    .DESCRIPTION
    This function defines a diagram options interaction object with various interactive features such as dragging nodes, dragging view, hiding edges on drag, hiding edges on zoom, hiding nodes on drag, hover effects, keyboard navigation, multiselect, navigation buttons, and selection options.

    .PARAMETER DragNodes
    Specifies whether dragging nodes is enabled.

    .PARAMETER DragView
    Specifies whether dragging the view is enabled.

    .PARAMETER HideEdgesOnDrag
    Specifies whether edges are hidden when dragging.

    .PARAMETER HideEdgesOnZoom
    Specifies whether edges are hidden when zooming.

    .PARAMETER HideNodesOnDrag
    Specifies whether nodes are hidden when dragging.

    .PARAMETER Hover
    Specifies whether hover effects are enabled.

    .PARAMETER HoverConnectedEdges
    Specifies whether connected edges are affected by hover.

    .PARAMETER KeyboardEnabled
    Specifies whether keyboard navigation is enabled.

    .PARAMETER KeyboardSpeedX
    Specifies the speed of movement in the X direction using the keyboard.

    .PARAMETER KeyboardSpeedY
    Specifies the speed of movement in the Y direction using the keyboard.

    .PARAMETER KeyboardSpeedZoom
    Specifies the speed of zooming using the keyboard.

    .PARAMETER KeyboardBindToWindow
    Specifies whether keyboard events are bound to the window.

    .PARAMETER Multiselect
    Specifies whether multiple selections are allowed.

    .PARAMETER NavigationButtons
    Specifies whether navigation buttons are displayed.

    .PARAMETER Selectable
    Specifies whether nodes and edges are selectable.

    .PARAMETER SelectConnectedEdges
    Specifies whether connected edges are selected along with nodes.

    .EXAMPLE
    New-DiagramOptionsInteraction -DragNodes -DragView -HideEdgesOnDrag -HideNodesOnDrag -Hover -KeyboardEnabled -Multiselect -Selectable -SelectConnectedEdges
    Creates a new diagram options interaction object with basic interactive features enabled.

    .EXAMPLE
    New-DiagramOptionsInteraction -DragNodes -DragView -HideEdgesOnDrag -HideNodesOnDrag -Hover -KeyboardEnabled -Multiselect -Selectable -SelectConnectedEdges -NavigationButtons
    Creates a new diagram options interaction object with navigation buttons added.

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