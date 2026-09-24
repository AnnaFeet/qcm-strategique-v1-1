$path = Join-Path $PSScriptRoot 'index.html'
$old = 'https://unpkg.com/survey-core/defaultV2.min.css'
$new = 'https://unpkg.com/survey-core/survey-core.min.css'
$content = Get-Content -Raw -Encoding UTF8 $path
if (-not $content.Contains($old)) {
    Write-Host 'Aucune modification nécessaire : la feuille de style corrigée est déjà présente.'
    exit 0
}
$content = $content.Replace($old, $new)
Set-Content -Path $path -Value $content -Encoding UTF8 -NoNewline
Write-Host 'index.html corrigé avec succès.'