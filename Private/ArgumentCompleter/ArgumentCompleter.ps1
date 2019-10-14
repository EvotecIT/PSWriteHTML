Register-ArgumentCompleter -CommandName New-HTMLText -ParameterName Color -ScriptBlock {$Script:RGBColors.Keys}
Register-ArgumentCompleter -CommandName New-HTMLText -ParameterName BackgroundColor -ScriptBlock {$Script:RGBColors.Keys}
Register-ArgumentCompleter -CommandName ConvertFrom-Color -ParameterName Color -ScriptBlock {$Script:RGBColors.Keys}