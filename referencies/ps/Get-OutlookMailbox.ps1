<#
.SYNOPSIS
Returns the VSTO folder object for the outlook inbox of the currently running user
.EXAMPLE
Get-OutlookInbox | Select-Object -Property SenderName, Subject, ReceivedTime
Displays the current contents of the inbox in a tabular format
#>
Add-type -assembly "Microsoft.Office.Interop.Outlook" | out-null 
$foldersType = "Microsoft.Office.Interop.Outlook.olDefaultFolders" -as [type]  
$outlook = new-object -comobject outlook.application 
$outlook.GetNameSpace("MAPI").getDefaultFolder($foldersType::olFolderInBox) 


# https://thomasmitchell.net/managing-calendar-permissions-in-o365-with-powershell/
# https://www.linkedin.com/pulse/powershell-script-ews-working-calendar-items-using-managed-chauhan/