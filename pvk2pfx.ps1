param(
    [String]$PrivateKeyName,
    [String]$CertificateName,
    [String]$PrivateKeyPassword,
    [String]$OutputPfxName = ""
)

$Here = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$Lib = Join-Path $Here "lib"

$pvk2pfxexe = Join-Path $Lib "pvk2pfx.exe"

if($OutputPfxName -eq "")
{
    $OutputPfxName = $PrivateKeyName.Replace("pvk", "pfx")
}

& $pvk2pfxexe -pvk $PrivateKeyName -spc $CertificateName -pfx $OutputPfxName -po $PrivateKeyPassword