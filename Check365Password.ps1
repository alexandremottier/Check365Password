Write-Host -ForegroundColor Yellow "...::: Outil de vérification de mot de passe Microsoft 365 :::..."
while(0 -lt 1){
$Credential = Get-Credential
Write-Host -ForegroundColor Yellow "Test de connexion en cours... " -NoNewline
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $Credential -Authentication Basic -AllowRedirection
Import-PSSession $Session | Out-Null

if ($Error.Count -eq 0) {
    Write-Host -ForegroundColor Green "Connexion OK !"
}else{
    Write-Host -ForegroundColor Red "Erreur de connexion ! Le mot de passe est-il correct ?"
}

Remove-PSSession $Session
}