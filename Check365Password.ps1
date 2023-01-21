<#
Script PowerShell qui vérifie si un mot de passe Microsoft 365 est correct
#>

# Définir le paramètre pour le nom d'utilisateur et le mot de passe
param (
   [string]$UserName,
   [string]$Password
)
 
# Connecter à Exchange Online
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential (New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $UserName, $(ConvertTo-SecureString -String $Password -AsPlainText -Force)) -Authentication Basic -AllowRedirection

# Tester l'authentification 
if ($Session) {
   Write-Host "Le mot de passe est correct"
} else {
   Write-Host "Le mot de passe est incorrect"
}

# Fermer la session
Remove-PSSession -Session $Session