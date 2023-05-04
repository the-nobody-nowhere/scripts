# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Disable Chocolatey Confirmations
choco feature enable -n=allowGlobalConfirmation

# Install Notepad ++
choco install notepadplusplus

# Install 7zip
choco install 7zip

# Install Adobe Reader
choco install adobereader

# Install Browsers
choco install googlechrome
choco install firefox

# Install Python
choco install python

# Enable Chocolatey Confirmations
choco feature disable -n=allowGlobalConfirmation

# Domain Join
$dc_ip = [System.Net.DNS]::GetHostAddresses("DulyDC")
Set-DnsClientServerAddress "Ethernet" -ServerAddresses("$dc_ip", "8.8.8.8")

$DCjoinPw = 'P@$$w0rd1234!' | ConvertTo-SecureString -asPlainText -Force
$DCjoinUser = "testdomain\administrator"
$credential = [PSCredential]::New($DCjoinUser,$DCjoinPw)

Add-Computer -DomainName testdomain.com -Credential $credential -Restart