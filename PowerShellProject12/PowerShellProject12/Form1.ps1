$destbtn_Click = {
	$destbro.showdialog()
	$destination.text = $destbro.SelectedPath
}
function Transfer-USMT
{
	$source= '\\'+$sourcepc.Text+'\C$\usmtfiles'
	$usmtfil=$usmttxt.Text
	start-process -FilePath cmd.exe -argumentlist "/K C:\windows\system32\robocopy.exe $usmtfil $source /E /Z /J /MT:3 /r:1 /NFL /NS"

}

function Update-Log
{
	param (
		[string]$Message,
		[string]$Color = 'Teal',
		[switch]$NoNewLine
	)
	
	$LogTextBox.Forecolor = $Color
	$LogTextBox.AppendText("$Message")
	if (-not $NoNewLine) { $LogTextBox.AppendText("`n") }
	$LogTextBox.Update()
	$LogTextBox.ScrollToCaret()
}

function start-backup{
	
	$destination = $destination.Text
	$selected = [array]$userchoice.checkeditems
	$selected | %{ $userstring += ($(if ($userstring) { "/ui " }) + " " + $_.domain + "\" + $_.username + " ") }
	$tobemigrated = $userstring
	$scanstatepath = "\\$sourcepc\C$\usmtfiles\scanstate.exe"
	#tochange
	$destination = 'C:\backupstore'
	$backupargs = $destination +' /ui:'+$tobemigrated +'/o /c /ue:*'
	Start-Process cmd.exe -ArgumentList "/k $scanstatepath $backupargs"
	

	}


	#$logjob = Start-Job -ScriptBlock {
#		Get-Content "$env:TEMP\usmt.log" -wait | foreach { Update-Log -message ($_) }
#	$procs | Wait-Process
#	$logjob | Stop-Job
#	update-log -Message "Success"

#		}
		<#
function start-restore
{
	$logs = '\usmt.log'
	$scanstatepath = "\\$sourcepc\C$\usmtfiles\scanstate.exe"
	$destination = 'C:\backupstore'
	$backupargs = $respath "/ue:*\* /ui:$tobemigrated /c /o"
	$procs = Start-Process $scanstatepath -ArgumentList $restoreargs
	$logjob = Start-Job -ScriptBlock {
		Get-Content "$env:TEMP\usmt.log" -wait | foreach { Update-Log -message ($_) }
		$procs | Wait-Process
		$logjob | Stop-Job
		update-log -Message "Success"
		
	}
}
	#>

Function New-RemoteProcess
{
	Param ([string]$computername = $env:computername,
		[string]$cmd = $(Throw "You must enter the full path to the command which will create the process.")
	)
	
	$ErrorActionPreference = "SilentlyContinue"
	
	Trap
	{
		Write-Warning "There was an error connecting to the remote computer or creating the process"
		Continue
	}
	
	Update-Log "Connecting to $computername" -ForegroundColor CYAN
	Update-Log "Process to create is $cmd" -ForegroundColor CYAN
	
	[wmiclass]$wmi = "\\$computername\root\cimv2:win32_process"
	
	#bail out if the object didn't get created
	if (!$wmi) { return }
	
	$remote = $wmi.Create($cmd)
	
	if ($remote.returnvalue -eq 0)
	{
		Update-Log "Successfully launched $cmd on $computername with a process id of" $remote.processid -ForegroundColor GREEN
	}
	else
	{
		Update-Log "Failed to launch $cmd on $computername. ReturnValue is" $remote.ReturnValue -ForegroundColor RED
	}
}

$browse_Click = {

if ($browser.ShowDialog() -eq 'OK')
	{ 
		Update-Log -Message "Checking for usmt files" -Color Teal
		$scanstate_file = get-childitem $browser.selectedpath | where -Property Name -EQ scanstate.exe

	if ($scanstate_file.exists)
	{
		Update-Log -Message ("USMT Files found within" + $browser.selectedpath) -Color teal
		$usmttxt.text = $browser.SelectedPath
	}
	else{
		$usmttxt.Text = "Invalid USMT directory - Select USMT Tools directory"
		Update-Log -Message "USMT Files not present, please re-select directory" -Color teal
	}
}
	else {Update-Log "user cancel"}
	}



function Update-ListBox
{	
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
		[System.Windows.Forms.ListBox]
		$ListBox,
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
		$Items,
		[Parameter(Mandatory = $false)]
		[string]
		$DisplayMember,
		[switch]
		$Append
	)
	
	if (-not $Append)
	{
		$listBox.Items.Clear()
	}
	
	if ($Items -is [System.Windows.Forms.ListBox+ObjectCollection] -or $Items -is [System.Collections.ICollection])
	{
		$listBox.Items.AddRange($Items)
	}
	elseif ($Items -is [System.Collections.IEnumerable])
	{
		$listBox.BeginUpdate()
		foreach ($obj in $Items)
		{
			$listBox.Items.Add($obj)
		}
		$listBox.EndUpdate()
	}
	else
	{
		$listBox.Items.Add($Items)
	}
	
	$listBox.DisplayMember = $DisplayMember
}

$getusersbtn_Click = {
$userchoice.Items.clear()
	$sourcepc = $sourcepc.text
	Update-Log "Verifying $sourcepc is online"
	$confirmPCup = Test-Path ('\\'+$sourcepc+'\c$\users')

	if ($confirmPCup -eq 'true')
	{
		Update-Log "$sourcepc is online - Enumerating users"
		$targetUsers = get-childitem \\$sourcepc\c$\users  -Attributes !hidden -Exclude *Administrator*,*defaultuser0*,*Public*,*.net*,*'$'* -name
		foreach ($targetUsers in $targetusers)
		{
			update-listbox $userchoice "$targetusers" -append
		}
	}
	else{Update-Log "PC specified is not online!!"}
	
}



$buttonExecuteTask_Click = {
	Update-Log start
	$selected = [array]$userchoice.checkeditems
	$selected | %{ $userstring += ($(if ($userstring) { "/ui " }) + " " + $_.domain + "\" + $_.username + " ") }
	$tobemigrated=$userstring
	update-log $tobemigrated
	if ($restore_rd.checked -eq 'True')
	{

		Update-Log "Restore is checked"
		Update-Log "Starting Restoration of"
		foreach ($selected in $selected)
		{
		Update-Log "$selected"\n
		}
		start-restore
	}

	elseif ($backup_rd.checked -eq 'True')
	{
	$sourcepc = $sourcepc.text
foreach($selected in $selected)    {
    {
		Update-Log "Backing up these users"\n$selected
	}
	start-backup
}

}
	}

$MainForm_Load = {
}

. (Join-Path $PSScriptRoot 'Form1.designer.ps1')

$MainForm.ShowDialog()