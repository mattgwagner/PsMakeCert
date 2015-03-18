param(
    [String]$SubjectName,
    [Switch]$SelfSigned = $true,
    [Switch]$IsExportable = $true,
    [String]$Algorithm = "sha512",
    [int]$KeyLength = 4096,
    [String]$PrivateKeyName = "",
    [String]$CertificateFile = "",
    [String]$ExtendedKeyUsage = "1.3.6.1.5.5.7.3.1" ## Server Authentication

)

$Here = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$Lib = Join-Path $Here "lib"

$makecertexe = Join-Path $Lib "makecert.exe"

if($PrivateKeyName -eq "")
{
    $PrivateKeyName = "$SubjectName.pvk"
}

if($CertificateFile -eq "")
{
    $CertificateFile = "$SubjectName.cer"
}

& $makecertexe -n "CN=$SubjectName" -r -pe -a $Algorithm -len $KeyLength -cy authority -eku $ExtendedKeyUsage -sv $PrivateKeyName $CertificateFile