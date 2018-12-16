Function Get-HTMLTabContentClose
{
	$tabclose = @()
	$tabclose += "</p>"
	$tabclose += '</div>'
	$tabclose += @"
<script>
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
"@
	write-output $tabclose
}