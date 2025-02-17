#Detect File : Detect-file.ps1
$product = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name LIKE '%Microsoft Visual C++%' AND Name LIKE '%x86%'"
$productVersion = $product.Version
if ($productVersion -ge "14.42.34433.0"){
	Write-Output "0"
}