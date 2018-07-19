[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$MainForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$label1 = $null
[System.Windows.Forms.Label]$label5 = $null
[System.Windows.Forms.Label]$label6 = $null
[System.Windows.Forms.TextBox]$cmdtxt = $null
[System.Windows.Forms.TextBox]$usmttxt = $null
[System.Windows.Forms.TextBox]$domaintxt = $null
[System.ServiceProcess.ServiceController]$serviceController1 = $null
[System.Windows.Forms.FolderBrowserDialog]$usmtbrowser = $null
[System.Windows.Forms.TextBox]$logtextbox = $null
[System.Windows.Forms.Label]$bac = $null
[System.Windows.Forms.Label]$restoreRD = $null
[System.Windows.Forms.RadioButton]$backup_rd = $null
[System.Windows.Forms.RadioButton]$restore_RD = $null
[System.Windows.Forms.Button]$getusersbtn = $null
[System.Windows.Forms.TextBox]$sourcepc = $null
[System.Windows.Forms.Button]$execute = $null
[System.Windows.Forms.Button]$test = $null
[System.Windows.Forms.Button]$browse = $null
[System.Windows.Forms.FolderBrowserDialog]$browser = $null
[System.Windows.Forms.TextBox]$destination = $null
[System.Windows.Forms.Label]$label2 = $null
[System.Windows.Forms.Button]$destbtn = $null
[System.Windows.Forms.FolderBrowserDialog]$destbro = $null
[System.Windows.Forms.CheckedListBox]$userchoice = $null
[System.Windows.Forms.VScrollBar]$vScrollBar1 = $null
[System.Windows.Forms.Label]$label4 = $null
[System.Windows.Forms.Button]$button1 = $null
function InitializeComponent
{
$resources = Invoke-Expression (Get-Content "$PSScriptRoot\Form1.resources.psd1" -Raw)
$getusersbtn = (New-Object -TypeName System.Windows.Forms.Button)
$cmdtxt = (New-Object -TypeName System.Windows.Forms.TextBox)
$usmttxt = (New-Object -TypeName System.Windows.Forms.TextBox)
$domaintxt = (New-Object -TypeName System.Windows.Forms.TextBox)
$sourcepc = (New-Object -TypeName System.Windows.Forms.TextBox)
$label1 = (New-Object -TypeName System.Windows.Forms.Label)
$label4 = (New-Object -TypeName System.Windows.Forms.Label)
$label5 = (New-Object -TypeName System.Windows.Forms.Label)
$label6 = (New-Object -TypeName System.Windows.Forms.Label)
$execute = (New-Object -TypeName System.Windows.Forms.Button)
$serviceController1 = (New-Object -TypeName System.ServiceProcess.ServiceController)
$usmtbrowser = (New-Object -TypeName System.Windows.Forms.FolderBrowserDialog)
$logtextbox = (New-Object -TypeName System.Windows.Forms.TextBox)
$backup_rd = (New-Object -TypeName System.Windows.Forms.RadioButton)
$restore_RD = (New-Object -TypeName System.Windows.Forms.RadioButton)
$test = (New-Object -TypeName System.Windows.Forms.Button)
$browser = (New-Object -TypeName System.Windows.Forms.FolderBrowserDialog)
$browse = (New-Object -TypeName System.Windows.Forms.Button)
$destination = (New-Object -TypeName System.Windows.Forms.TextBox)
$label2 = (New-Object -TypeName System.Windows.Forms.Label)
$destbtn = (New-Object -TypeName System.Windows.Forms.Button)
$destbro = (New-Object -TypeName System.Windows.Forms.FolderBrowserDialog)
$userchoice = (New-Object -TypeName System.Windows.Forms.CheckedListBox)
$vScrollBar1 = (New-Object -TypeName System.Windows.Forms.VScrollBar)
$MainForm.SuspendLayout()
#
#getusersbtn
#
$getusersbtn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]9.749999,[System.Drawing.FontStyle]::Bold))
$getusersbtn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]130,[System.Int32]80))
$getusersbtn.Name = [System.String]'getusersbtn'
$getusersbtn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$getusersbtn.TabIndex = [System.Int32]2
$getusersbtn.Text = [System.String]'Get Users'
$getusersbtn.UseVisualStyleBackColor = $true
$getusersbtn.add_Click($getusersbtn_Click)
#
#cmdtxt
#
$cmdtxt.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]9.749999,[System.Drawing.FontStyle]::Bold))
$cmdtxt.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]373))
$cmdtxt.Name = [System.String]'cmdtxt'
$cmdtxt.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]474,[System.Int32]23))
$cmdtxt.TabIndex = [System.Int32]8
#
#usmttxt
#
$usmttxt.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]9.749999,[System.Drawing.FontStyle]::Bold))
$usmttxt.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]13,[System.Int32]222))
$usmttxt.Name = [System.String]'usmttxt'
$usmttxt.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]324,[System.Int32]23))
$usmttxt.TabIndex = [System.Int32]4
$usmttxt.add_TextChanged($usmttxt_TextChanged)
#
#domaintxt
#
$domaintxt.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]9.749999,[System.Drawing.FontStyle]::Bold))
$domaintxt.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]13,[System.Int32]159))
$domaintxt.Name = [System.String]'domaintxt'
$domaintxt.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]60,[System.Int32]23))
$domaintxt.TabIndex = [System.Int32]3
#
#sourcepc
#
$sourcepc.BackColor = [System.Drawing.SystemColors]::Window
$sourcepc.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]9.749999,[System.Drawing.FontStyle]::Bold))
$sourcepc.HideSelection = $false
$sourcepc.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]83))
$sourcepc.Name = [System.String]'sourcepc'
$sourcepc.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]105,[System.Int32]23))
$sourcepc.TabIndex = [System.Int32]1
$sourcepc.Text = [System.String]'ser'
#
#label1
#
$label1.AutoSize = $true
$label1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]41))
$label1.Name = [System.String]'label1'
$label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]163,[System.Int32]19))
$label1.TabIndex = [System.Int32]55
$label1.Text = [System.String]'Target PC Name'
#
#label4
#
$label4.AutoSize = $true
$label4.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$label4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]200))
$label4.Name = [System.String]'label4'
$label4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]196,[System.Int32]19))
$label4.TabIndex = [System.Int32]12
$label4.Text = [System.String]'USMT Source Files'
#
#label5
#
$label5.AutoSize = $true
$label5.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$label5.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$label5.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]126))
$label5.Name = [System.String]'label5'
$label5.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]19))
$label5.TabIndex = [System.Int32]13
$label5.Text = [System.String]'Domain'
#
#label6
#
$label6.AutoSize = $true
$label6.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$label6.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]339))
$label6.Name = [System.String]'label6'
$label6.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]141,[System.Int32]19))
$label6.TabIndex = [System.Int32]14
$label6.Text = [System.String]'Commandline '
#
#execute
#
$execute.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]9.749999,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$execute.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]492,[System.Int32]360))
$execute.Name = [System.String]'execute'
$execute.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]82,[System.Int32]44))
$execute.TabIndex = [System.Int32]9
$execute.Text = [System.String]'Execute'
$execute.UseVisualStyleBackColor = $true
$execute.add_Click($execute_Click)
#
#usmtbrowser
#
$usmtbrowser.RootFolder = [System.Environment+SpecialFolder]::Windows
#
#logtextbox
#
$logtextbox.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]9.749999,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$logtextbox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]16,[System.Int32]417))
$logtextbox.Multiline = $true
$logtextbox.Name = [System.String]'logtextbox'
$logtextbox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]570,[System.Int32]240))
$logtextbox.TabIndex = [System.Int32]10
#
#backup_rd
#
$backup_rd.AutoSize = $true
$backup_rd.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$backup_rd.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]244,[System.Int32]144))
$backup_rd.Name = [System.String]'backup_rd'
$backup_rd.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]93,[System.Int32]23))
$backup_rd.TabIndex = [System.Int32]19
$backup_rd.Text = [System.String]'Backup'
$backup_rd.UseVisualStyleBackColor = $true
#
#restore_RD
#
$restore_RD.AutoSize = $true
$restore_RD.Checked = $true
$restore_RD.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$restore_RD.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]244,[System.Int32]104))
$restore_RD.Name = [System.String]'restore_RD'
$restore_RD.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]104,[System.Int32]23))
$restore_RD.TabIndex = [System.Int32]20
$restore_RD.TabStop = $true
$restore_RD.Text = [System.String]'Restore'
$restore_RD.UseVisualStyleBackColor = $true
#
#test
#
$test.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]259,[System.Int32]52))
$test.Name = [System.String]'test'
$test.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$test.TabIndex = [System.Int32]22
$test.Text = [System.String]'button2'
$test.UseVisualStyleBackColor = $true
$test.add_Click($test_Click)
#
#browser
#
$browser.add_HelpRequest($folderBrowserDialog1_HelpRequest)
#
#browse
#
$browse.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]343,[System.Int32]222))
$browse.Name = [System.String]'browse'
$browse.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]20,[System.Int32]25))
$browse.TabIndex = [System.Int32]5
$browse.Text = [System.String]'.'
$browse.UseVisualStyleBackColor = $true
$browse.add_Click($browse_Click)
#
#destination
#
$destination.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]9.749999,[System.Drawing.FontStyle]::Bold))
$destination.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]16,[System.Int32]290))
$destination.Name = [System.String]'destination'
$destination.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]302,[System.Int32]23))
$destination.TabIndex = [System.Int32]6
$destination.Text = [System.String]'C:\backupstore'
#
#label2
#
$label2.AutoSize = $true
$label2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$label2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]259))
$label2.Name = [System.String]'label2'
$label2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]251,[System.Int32]19))
$label2.TabIndex = [System.Int32]25
$label2.Text = [System.String]'Destination of Backups'
#
#destbtn
#
$destbtn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]328,[System.Int32]287))
$destbtn.Name = [System.String]'destbtn'
$destbtn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]20,[System.Int32]25))
$destbtn.TabIndex = [System.Int32]7
$destbtn.Text = [System.String]'.'
$destbtn.UseVisualStyleBackColor = $true
$destbtn.add_Click($destbtn_Click)
#
#userchoice
#
$userchoice.CheckOnClick = $true
$userchoice.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code Retina',[System.Single]9.749999,[System.Drawing.FontStyle]::Bold))
$userchoice.FormattingEnabled = $true
$userchoice.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]435,[System.Int32]41))
$userchoice.Name = [System.String]'userchoice'
$userchoice.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]164,[System.Int32]274))
$userchoice.TabIndex = [System.Int32]11
$userchoice.TabStop = $false
$userchoice.ThreeDCheckBoxes = $true
#
#vScrollBar1
#
$vScrollBar1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]569,[System.Int32]417))
$vScrollBar1.Name = [System.String]'vScrollBar1'
$vScrollBar1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]17,[System.Int32]240))
$vScrollBar1.TabIndex = [System.Int32]28
#
#MainForm
#
$MainForm.AutoValidate = [System.Windows.Forms.AutoValidate]::EnableAllowFocusChange
$MainForm.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$MainForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]616,[System.Int32]740))
$MainForm.Controls.Add($vScrollBar1)
$MainForm.Controls.Add($userchoice)
$MainForm.Controls.Add($destbtn)
$MainForm.Controls.Add($label2)
$MainForm.Controls.Add($destination)
$MainForm.Controls.Add($browse)
$MainForm.Controls.Add($test)
$MainForm.Controls.Add($restore_RD)
$MainForm.Controls.Add($backup_rd)
$MainForm.Controls.Add($logtextbox)
$MainForm.Controls.Add($label6)
$MainForm.Controls.Add($label5)
$MainForm.Controls.Add($label4)
$MainForm.Controls.Add($label1)
$MainForm.Controls.Add($execute)
$MainForm.Controls.Add($sourcepc)
$MainForm.Controls.Add($domaintxt)
$MainForm.Controls.Add($usmttxt)
$MainForm.Controls.Add($cmdtxt)
$MainForm.Controls.Add($getusersbtn)
$MainForm.ForeColor = [System.Drawing.Color]::DodgerBlue
$MainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Fixed3D
$MainForm.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$MainForm.Name = [System.String]'MainForm'
$MainForm.Text = [System.String]'USMT GUI'
$MainForm.add_Load($MainForm_Load)
$MainForm.ResumeLayout($false)
$MainForm.PerformLayout()
Add-Member -InputObject $MainForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name label1 -Value $label1 -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name label5 -Value $label5 -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name label6 -Value $label6 -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name cmdtxt -Value $cmdtxt -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name usmttxt -Value $usmttxt -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name domaintxt -Value $domaintxt -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name serviceController1 -Value $serviceController1 -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name usmtbrowser -Value $usmtbrowser -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name logtextbox -Value $logtextbox -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name bac -Value $bac -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name restoreRD -Value $restoreRD -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name backup_rd -Value $backup_rd -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name restore_RD -Value $restore_RD -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name getusersbtn -Value $getusersbtn -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name sourcepc -Value $sourcepc -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name execute -Value $execute -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name test -Value $test -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name browse -Value $browse -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name browser -Value $browser -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name destination -Value $destination -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name label2 -Value $label2 -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name destbtn -Value $destbtn -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name destbro -Value $destbro -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name userchoice -Value $userchoice -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name vScrollBar1 -Value $vScrollBar1 -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name label4 -Value $label4 -MemberType NoteProperty
Add-Member -InputObject $MainForm -Name button1 -Value $button1 -MemberType NoteProperty
}
. InitializeComponent
