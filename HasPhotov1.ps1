Connect-AzureAD
$outfile = "C:\temp\UserProfilePic_Report.csv"
    
 $users = Get-AzureADUser -All $true
 $results = foreach($user in $users){
     $userName = $user.SAMAccount
     try{
         $profilePics = Get-AzureADUserThumbnailPhoto -ObjectId $user.ObjectId
         if($profilePics -ne $null)
         {
             foreach($profilePic in $profilePics){
                Write-Host "User $userName has profile pic" -ForegroundColor Green
                $output = @($userName + ", Present")
                $output | Out-File -FilePath $outfile -Append -Force 
     
             }
         }
            
     } catch{
         Write-Host "User $userName doesnt have a profile pic"  -ForegroundColor Red
         $output = @($userName + ", Not_Present")
         $output | Out-File -FilePath $outfile -Append -Force 
     }
        
 }
    
 Import-Csv -Path $outfile