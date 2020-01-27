Write-Host "If this install script fails, ensure you run the following:"
Write-Host "Set-ExecutionPolicy -Scope CurrentUser Unrestricted"

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y git
choco install -y googlechrome
choco install -y python3
choco install -y sublimetext3
choco install -y sublimemerge
choco install -y jetbrainstoolbox
choco install -y 7zip
choco install -y awscli
choco install -y vscode
choco install -y terraform
choco install -y slack
choco install -y microsoft-windows-terminal
choco install -y exercism-io-cli

& $env:ProgramFiles\Git\git-bash.exe -c 'cd ../../ && ./init.sh'
pause