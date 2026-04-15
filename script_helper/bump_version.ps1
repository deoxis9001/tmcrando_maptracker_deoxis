param([string]$ManifestPath = "manifest.json")

$content = Get-Content $ManifestPath -Raw
if ($content -match '"package_version":\s*"(\d+\.\d+\.\d+\.)(\d+)"') {
    $prefix  = $Matches[1]
    $newNum  = [int]$Matches[2] + 1
    $newVer  = "$prefix$newNum"
    $content = $content -replace '"package_version":\s*"\d+\.\d+\.\d+\.\d+"', "`"package_version`": `"$newVer`""
    $content | Set-Content $ManifestPath -Encoding UTF8 -NoNewline
    Write-Output $newVer
} else {
    Write-Error "package_version introuvable dans $ManifestPath"
    exit 1
}
