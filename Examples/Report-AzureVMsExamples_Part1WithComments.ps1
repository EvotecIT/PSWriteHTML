param (
 $ReportOutputPath
)
 
Import-Module ReportHtml
Get-Command -Module ReportHtml
 
$ReportName = "Azure VMs Report"
 
if (!$ReportOutputPath) 
{
 $ReportOutputPath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
} 
 
# see if we already have a session. If we don't don't re-authN
if (!$AzureRMAccount.Context.Tenant) {
    $AzureRMAccount = Add-AzureRmAccount
}

# Get arrary of VMs from ARM
$RMVMs = get-azurermvm
 
$RMVMArray = @() ; $TotalVMs = $RMVMs.Count; $i =1 
 
# Loop through VMs
foreach ($vm in $RMVMs)
{  
# Tracking progress
  Write-Progress -PercentComplete ($i / $TotalVMs * 100) -Activity "Building VM array" -CurrentOperation  ($vm.Name + " in resource group " + $vm.ResourceGroupName)
     
# Get VM Status (for Power State)
  $vmStatus = Get-AzurermVM -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName -Status
 
  # Generate Array
  $RMVMArray += New-Object PSObject -Property @{`
 
    # Collect Properties
    ResourceGroup = $vm.ResourceGroupName
    Name = $vm.Name;
    PowerState = (get-culture).TextInfo.ToTitleCase(($vmStatus.statuses)[1].code.split("/")[1]);
    Location = $vm.Location;
    Tags = $vm.Tags
    Size = $vm.HardwareProfile.VmSize;
    ImageSKU = $vm.StorageProfile.ImageReference.Sku;
    OSType = $vm.StorageProfile.OsDisk.OsType;
    OSDiskSizeGB = $vm.StorageProfile.OsDisk.DiskSizeGB;
    DataDiskCount = $vm.StorageProfile.DataDisks.Count;
    DataDisks = $vm.StorageProfile.DataDisks;
    }
    $I++
}

Function Test-Report
{
    param ($TestName)
    $rptFile = join-path $ReportOutputPath ($ReportName.replace(" ","") + "-$TestName" + ".mht")
    $rpt | Set-Content -Path $rptFile -Force
    Invoke-Item $rptFile
    sleep 1
}

####### Example 1 #######
# Create an empty array for HTML strings
$rpt = @()
 
# note from here on we always append to the $rpt array variable.
# First, let's add the HTML header information including report title
$rpt += Get-HtmlOpen -TitleText $ReportName
 
#  This content open function add a section header
$rpt += Get-HtmlContentOpen -HeaderText "Virtual Machines"
 
# This creates an HTML table of whatever array you pass into the function
$rpt += Get-HtmlContentTable $RMVMArray
 
#  This content close function closes the section 
$rpt += Get-HtmlContentClose
 
#  This HTML close adds HTML footer 
$rpt += Get-HtmlClose
 
# Now let's test what we have
Test-Report -TestName Example1


####### Example 2 ########
$rpt = @()
$rpt += Get-HtmlOpen -TitleText $ReportName
$rpt += Get-HtmlContentOpen -HeaderText "Virtual Machines"
 
# here we are going to filter the recordset, reorder the columns and group the results by location.  
# The value you group by must be first in the select statement 
$rpt += Get-HtmlContentTable ($RMVMArray | select Location, ResourceGroup, Name, Size,PowerState,DataDiskCount, ImageSKU ) -GroupBy Location
$rpt += Get-HtmlContentClose
$rpt += Get-HtmlClose
 
Test-Report -TestName Example2

####### Example 3 ########
$rpt = @()
$rpt += Get-HtmlOpen -TitleText $ReportName
 
# adding the summary section 
$rpt += Get-HtmlContentOpen -HeaderText "Summary Information"
$rpt += Get-HtmlContenttext -Heading "Total VMs" -Detail ( $RMVMArray.Count)
$rpt += Get-HtmlContenttext -Heading "VM Power State" -Detail ("Running " + ($RMVMArray | ? {$_.PowerState -eq 'Running'} | measure ).count + " / Deallocated " + ($RMVMArray | ? {$_.PowerState -eq 'Deallocated'} | measure ).count)
$rpt += Get-HtmlContenttext -Heading "Total Data Disks" -Detail $RMVMArray.datadisks.count
$rpt += Get-HtmlContentClose
 
# adding the VM size section.  Note the -IsHidden switch
$rpt += Get-HtmlContentOpen -HeaderText "VM Size Summary" -IsHidden
$rpt += Get-HtmlContenttable ($RMVMArray | group size | select Name, Count | sort count -Descending ) -Fixed
$rpt += Get-HtmlContentClose
 
# Note I have also added the -IsHidden Switch here
$rpt += Get-HtmlContentOpen -HeaderText "Virtual Machines" -IsHidden
$rpt += Get-HtmlContentTable ($RMVMArray | select Location, ResourceGroup, Name, Size,PowerState, DataDiskCount, ImageSKU ) -GroupBy Location
$rpt += Get-HtmlContentClose
$rpt += Get-HtmlClose
 
Test-Report -TestName Example3

####### Example 4 ########
$rpt = @()
$rpt += Get-HtmlOpen -TitleText $ReportName
$rpt += Get-HtmlContentOpen -HeaderText "Summary Information"
$rpt += Get-HtmlContenttext -Heading "Total VMs" -Detail ( $RMVMArray.Count)
$rpt += Get-HtmlContenttext -Heading "VM Power State" -Detail ("Running " + ($RMVMArray | ? {$_.PowerState -eq 'Running'} | measure ).count + " / Deallocated " + ($RMVMArray | ? {$_.PowerState -eq 'Deallocated'} | measure ).count)
$rpt += Get-HtmlContenttext -Heading "Total Data Disks" -Detail $RMVMArray.datadisks.count
$rpt += Get-HtmlContentClose
$rpt += Get-HtmlContentOpen -HeaderText "VM Size Summary" -IsHidden
$rpt += Get-HtmlContenttable ($RMVMArray | group size | select Name, Count | sort count -Descending ) -Fixed
$rpt += Get-HtmlContentClose
 
# We are introducing -BackgroundShade 2 so that we can clearly see the sections.  
# This helps with larger reports and many when there are many levels to the sections
$rpt += Get-HtmlContentOpen -HeaderText "Virtual Machines by location" -IsHidden
 
# adding the foreach loop for the group recordset.   
foreach ($Group in ($RMVMArray | select Location, ResourceGroup, Name, Size,PowerState,  DataDiskCount, ImageSKU | group location ) ) {
 
#for every group that exists for a location we will create an HTML section.  I have also specified the -BackgroupShade to 1
    $rpt += Get-HtmlContentOpen -HeaderText ("Virtual Machines for location '" + $group.Name +"'") -IsHidden -BackgroundShade 1
 
# Each recordset may have different data in the columns and therefore create different width in the table columns.
# We would like it to look the same. We can use the -Fixed switch to produce evenly space columns for the table
    $rpt += Get-HtmlContentTable ($Group.Group | select ResourceGroup, Name, Size,PowerState,  DataDiskCount, ImageSKU ) -Fixed
    $rpt += Get-HtmlContentClose
}
$rpt += Get-HtmlContentClose
$rpt += Get-HtmlClose
 
Test-Report -TestName Example4

####### Example 5 ########
$rpt = @()
$rpt += Get-HtmlOpen -TitleText ($ReportName + "Example 5")
$rpt += Get-HtmlContentOpen -HeaderText "Summary Information" -BackgroundShade 1
$rpt += Get-HtmlContenttext -Heading "Total VMs" -Detail ( $RMVMArray.Count)
$rpt += Get-HtmlContenttext -Heading "VM Power State" -Detail ("Running " + ($RMVMArray | ? {$_.PowerState -eq 'Running'} | measure ).count + " / Deallocated " + ($RMVMArray | ? {$_.PowerState -eq 'Deallocated'} | measure ).count)
$rpt += Get-HtmlContenttext -Heading "Total Data Disks" -Detail $RMVMArray.datadisks.count
$rpt += Get-HtmlContentClose
$rpt += Get-HtmlContentOpen -HeaderText "VM Size Summary" -IsHidden -BackgroundShade 1
$rpt += Get-HtmlContenttable ($RMVMArray | group size | select Name, Count | sort count -Descending ) -Fixed
$rpt += Get-HtmlContentClose
$rpt += Get-HtmlContentOpen -HeaderText "Virtual Machines by location" -BackgroundShade 3
foreach ($Group in ($RMVMArray | select Location, ResourceGroup, Name, Size,PowerState,  DataDiskCount, ImageSKU | group location ) ) {
 
# Here we are creating a group to use for the IF condition, so we can create sections for VMs by powerstate, Running or Deallocated 
    $PowerState = $Group.Group | group PowerState 
    $rpt += Get-HtmlContentOpen -HeaderText ("Virtual Machines for location '" + $group.Name +"' - "  + $Group.Group.Count + " VMs") -IsHidden -BackgroundShade 2
 
# If there are VMs in the running group, continue and create a section for them 
        if (($PowerState | ? {$_.name -eq 'running'})) 
                {
            $rpt += Get-HtmlContentOpen -HeaderText ("Running Virtual Machines") -BackgroundShade 1
            $rpt += Get-HtmlContentTable ($Group.Group | where {$_.PowerState -eq "Running"} | select ResourceGroup, Name, Size,  DataDiskCount, ImageSKU  ) -Fixed
            $rpt += Get-HtmlContentClose
        }
 
# If there are VMs in the running group, continue and create a section for them
        if (($PowerState | ? {$_.name -eq 'Deallocated'})) 
                {
            $rpt += Get-HtmlContentOpen -HeaderText ("Deallocated") -BackgroundShade 1 -IsHidden
            $rpt += Get-HtmlContentTable ($Group.Group  | where {$_.PowerState -eq "Deallocated"} | select ResourceGroup, Name, Size,  DataDiskCount, ImageSKU)-Fixed 
            $rpt += Get-HtmlContentClose
        }
    $rpt += Get-HtmlContentClose
}
$rpt += Get-HtmlContentClose
$rpt += Get-HtmlClose
 
Test-Report -TestName Example5

Invoke-Item $ReportOutputPath