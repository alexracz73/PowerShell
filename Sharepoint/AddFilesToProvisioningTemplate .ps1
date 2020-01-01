   $Folders = @('Documents','Scripts')
   $xmlLocation = 'c:\onedrive\template.pnp'
   $FoldersLocation = "C:\onedrive"

      $Folders | ForEach-Object {
   $path = $FoldersLocation + "\" + $_;
   (dir $path -Recurse) | %{
  try{
    $FName = "{site}" + $_.Directory.FullName.Substring($FoldersLocation.Length)
    Add-PnPFileToProvisioningTemplate -Path $xmlLocation -Source $_.FullName -Folder $FName -Container $_.Directory.FullName  -ErrorAction Ignore
  }
 catch{}
 }
}