function Add-CustomFormatForDatetimeSorting {
    <#
    .SYNOPSIS

    .DESCRIPTION
        This function adds code to make the datatable columns sortable with different datetime formats.
        Formatting:
        Day (of Month)
        D       -   1 2 ... 30 31
        Do      -   1st 2nd ... 30th 31st
        DD      -   01 02 ... 30 31

        Month
        M       -   1 2 ... 11 12
        Mo      -   1st 2nd ... 11th 12th
        MM      -   01 02 ... 11 12
        MMM     -   Jan Feb ... Nov Dec
        MMMM    -   January February ... November December

        Year
        YY      -   70 71 ... 29 30
        YYYY    -   1970 1971 ... 2029 2030

        Hour
        H       -   0 1 ... 22 23
        HH      -   00 01 ... 22 23
        h       -   1 2 ... 11 12
        hh      -   01 02 ... 11 12

        Minute
        m       -   0 1 ... 58 59
        mm      -   00 01 ... 58 59

        Second
        s       -   0 1 ... 58 59
        ss      -   00 01 ... 58 59

        More formats
        http://momentjs.com/docs/#/displaying/

    .PARAMETER CustomDateTimeFormat
        Array with strings of custom datetime format.
        The string is build from two parts. Format and locale. Locale is optional.
        format explanation: http://momentjs.com/docs/#/displaying/
        locale explanation: http://momentjs.com/docs/#/i18n/


    .LINK
        format explanation: http://momentjs.com/docs/#/displaying/
        locale explanation: http://momentjs.com/docs/#/i18n/
    .Example
        Add-CustomFormatForDatetimeSorting -CustomDateFormat 'dddd, MMMM Do, YYYY','HH:mm MMM D, YY'
    .Example
        Add-CustomFormatForDatetimeSorting -CustomDateFormat 'DD.MM.YYYY HH:mm:ss'
    #>
    [CmdletBinding()]
    param(
        [array]$DateTimeSortingFormat
    )
    if ($DateTimeSortingFormat) {
        [array]$OutputDateTimeSortingFormat = foreach ($format in $DateTimeSortingFormat) {
            "$.fn.dataTable.moment( '$format' );"
        }
    } else {
        # Default localized format
        $OutputDateTimeSortingFormat = "$.fn.dataTable.moment( 'L' );"
    }
    return $OutputDateTimeSortingFormat
}
