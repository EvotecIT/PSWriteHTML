function Add-HTML {
    <#
    .SYNOPSIS
    Adds HTML content to the email body.

    .DESCRIPTION
    This function adds HTML content to the email body by executing the provided ScriptBlock containing the HTML code.

    .PARAMETER HTML
    Specifies the ScriptBlock containing the HTML code to be added to the email body.

    .EXAMPLE
    $HTMLContent = {
        Set-Tag -HtmlObject @{
            Tag = 'div'
            Attributes = @{
                'class' = 'container'
            }
            Value = 'Hello, World!'
        }
    }

    Add-HTML -HTML $HTMLContent
    Adds a <div class="container">Hello, World!</div> to the email body.

    .EXAMPLE
    $HTMLContent = {
        Set-Tag -HtmlObject @{
            Tag = 'ul'
            Attributes = @{
                'id' = 'list'
            }
            Value = @(
                @{
                    Tag = 'li'
                    Value = 'Item 1'
                }
                @{
                    Tag = 'li'
                    Value = 'Item 2'
                }
            )
        }
    }

    Add-HTML -HTML $HTMLContent
    Adds a list with items 'Item 1' and 'Item 2' to the email body.
    #>
    [alias('EmailHTML')]
    [CmdletBinding()]
    param(
        [ScriptBlock] $HTML
    )
    Invoke-Command -ScriptBlock $HTML
}