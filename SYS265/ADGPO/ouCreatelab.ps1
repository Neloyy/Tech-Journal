$domain = "DC=jake,DC=Local"
$ouPath = "OU=Software Deploy, $domain"

New-ADOrganizationalUnit -Name "Software Deploy" -Path $domain

Get-ADComputer -Identity "wks01-jake" | Move-ADObject -TargetPath "OU=Software Deploy, DC=jake,DC=local"

Set-ADOrganizationalUnit -Identity "OU=Test OU,DC=jake,DC=local" -ProtectedFromAccidentalDeletion $false
Remove-ADOrganizationalUnit -Identity "OU=Test OU,DC=jake,DC=local" -Confirm:$false