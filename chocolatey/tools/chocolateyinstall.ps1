$ErrorActionPreference = 'Stop'

$packageName = 'amp'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://packages.ampcode.com/binaries/cli/v0.0.1756599602/amp-windows-x64.exe'
$checksum64 = '6e4c2310ba2971bbf882579b9f7b35185fbbc37da54c50da09892c1123afe74f'

$packageArgs = @{
  packageName   = $packageName
  fileFullPath  = Join-Path $toolsDir 'amp.exe'
  url64bit      = $url64
  checksum64    = $checksum64
  checksumType64= 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Create shim for amp.exe
$exePath = Join-Path $toolsDir 'amp.exe'
if (Test-Path $exePath) {
    Install-BinFile -Name 'amp' -Path $exePath
}
