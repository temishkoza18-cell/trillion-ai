$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$desktop = [Environment]::GetFolderPath('DesktopDirectory')
 $target = Join-Path $root '.venv\Scripts\pythonw.exe'
if (-not (Test-Path -LiteralPath $target -PathType Leaf)) {
    throw 'Trillion Python runtime is missing. Run install_and_run.bat first.'
}
$arguments = '-m backend.desktop'
$name = 'Trillion AI'
$icon = "$env:SystemRoot\System32\shell32.dll,220"
$workingDirectory = $root
$path = Join-Path $desktop ($name + '.lnk')
$shell = New-Object -ComObject WScript.Shell
$link = $shell.CreateShortcut($path)
$link.TargetPath = $target
$link.Arguments = $arguments
$link.WorkingDirectory = $workingDirectory
$link.Description = 'Launch the local Trillion AI assistant'
$link.IconLocation = $icon
$link.Save()
Write-Output $path
