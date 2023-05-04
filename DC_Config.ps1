# Install the AD-Domain-Services and management tools
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

# Define parameters for Install-ADDSForest cmdlet
$domainName = "testdomain.com"
$safeModeAdministratorPassword = 'P@$$w0rd1234!'
$securePassword = ConvertTo-SecureString $safeModeAdministratorPassword -AsPlainText -Force

# Run the Install-ADDSForest cmdlet with the specified parameters
Install-ADDSForest -DomainName $domainName -SafeModeAdministratorPassword $securePassword -Force
