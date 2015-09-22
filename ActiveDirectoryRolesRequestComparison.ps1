#dot source the script if using outside the ISE

Function ActiveDirectoryRolesComparison{

Param(
    [Parameter(Mandatory=$true)]
    [string]
    $firstUser,

    #[Parameter(Mandatory=$true)]
    [string]
    $secondUser

    [bool]
    $out

)

Import-Module ActiveDirectory

If($secondUser.Length -eq 0)
{
    #take some other action here
}

$currentPath = $PSScriptRoot;

$resultSet = @()
$resultsFile = $path + "\differences.txt";

$groupMembershipFirstUser =  Get-ADPrincipalGroupMembership -Identity $firstUser
#$groupMembershipFirstUser =  Get-ADPrincipalGroupMembership -Identity $firstUser



If($out)
{
    $resultSet | % {$_} | Out-File $resultsFile
}

}



$errors=@()
@(groupMembershipFirstUser) | % {
   $group=$_
   try
   {
       Write-Output "Requesting Access for $group"
       Invoke-AccessManagerRequest "oleg.shalygin" "$group" "Dev Role Access";
   }
   catch
   {
       $errors+=$group
       Write-Error $_
   }
}
Write-Output "Failed to request the following groups"
$errors

Get-ADPrincipalGroupMembership -Identity jdoe | Format-Table -Property name
#(Get-ADUser userName –Properties MemberOf | Select-Object MemberOf).MemberOf
Import-Module ActiveDirectory