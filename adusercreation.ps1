$NewADUser = Import-Csv -Path 'C:\Users\Administrator\Desktop\ADusers1.csv' 

foreach ($ADUser in $NewADUser) {

     $parameters = @{

        Enabled = $true
        Path = "CN=Users,DC=lab,DC=coryfielding,DC=net"

        Name = "$($ADUser.First) $($ADUser.Last)"
        UserPrincipalName = "$($ADUser.First).$($ADUser.Last)@lab.coryfielding.net"
        SamAccountName = "$($ADUser.First)$($ADUser.Last)"

        GivenName = $ADUser.First
        Surname = $ADUser.Last


        AccountPassword = "P@ssw0rd" | ConvertTo-SecureString -AsPlainText -Force
 	ChangePasswordAtLogon = $true

     }

    New-ADUser @parameters  
    Read-Host -Prompt "Press Enter to exit"
}
