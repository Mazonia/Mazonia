# PowerShell script to deploy GitHub Profile README for @Mazonia
param(
    [string]$CommitMessage = "feat: add flagship ultra-high-tech GitHub profile README"
)

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "   Deploying GitHub Profile README for @Mazonia     " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

$ProfileRepoDir = $PSScriptRoot
Set-Location $ProfileRepoDir

if (-not (Test-Path ".git")) {
    Write-Host "[+] Initializing git repository..." -ForegroundColor Green
    git init
    git branch -M main
}

Write-Host "[+] Staging files..." -ForegroundColor Green
git add README.md

Write-Host "[+] Committing files..." -ForegroundColor Green
git commit -m $CommitMessage

$RemoteUrl = "https://github.com/Mazonia/Mazonia.git"
$ExistingRemote = git remote get-url origin 2>$null
if (-not $ExistingRemote) {
    Write-Host "[+] Adding git remote origin ($RemoteUrl)..." -ForegroundColor Green
    git remote add origin $RemoteUrl
} else {
    Write-Host "[+] Updating git remote origin ($RemoteUrl)..." -ForegroundColor Green
    git remote set-url origin $RemoteUrl
}

Write-Host ""
Write-Host "----------------------------------------------------" -ForegroundColor Yellow
Write-Host "IMPORTANT STEP TO PUBLISH TO YOUR GITHUB PROFILE:" -ForegroundColor Yellow
Write-Host "1. Create a NEW PUBLIC repository named 'Mazonia' at:" -ForegroundColor White
Write-Host "   https://github.com/new" -ForegroundColor Cyan
Write-Host "   (Make sure repository name is exactly: Mazonia)" -ForegroundColor Yellow
Write-Host "2. Once created, run this command in PowerShell:" -ForegroundColor White
Write-Host "   git push -u origin main" -ForegroundColor Green
Write-Host "----------------------------------------------------" -ForegroundColor Yellow
