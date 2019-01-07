function Format-Html {
    param (
        $Object
    )

    switch ($Object) {
        {$_._type -eq 'img'} { Format-ImageTag -Object $Object}
        {$_._type -eq 'link'} { Format-AnchorTag -Object $Object }
        Default {
            throw "Unknown type, $($_._type)"
        }
    }    
}