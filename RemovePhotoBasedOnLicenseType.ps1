 $Users = Get-AzureADUser | Where {$_.UserType -eq 'Member' -and $_.AssignedLicenses -ne 'EnterprisePack'}
>>
>> foreach ($user in $Users) { Remove-UserPhoto -Identity $user.UserPrincipalName -Confirm:$false} 
