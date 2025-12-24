# =========================================
# O.S. Electric – MD to HTML Page Builder
# =========================================

$siteRoot = "D:\OSelectric website"
Set-Location $siteRoot

Write-Host "RUNNING PAGE GENERATOR" -ForegroundColor Cyan

function Convert-MdToHtmlPage {
    param (
        [string]$MdFile,
        [string]$HtmlFile,
        [string]$Title,
        [string]$HeroTitle,
        [string]$HeroSubtitle
    )

    if (!(Test-Path $MdFile)) {
        Write-Host "Missing $MdFile – skipping" -ForegroundColor Yellow
        return
    }

    Write-Host "Generating $HtmlFile from $MdFile"

    $content = Get-Content $MdFile -Raw
    $content = $content -replace "(?s)^---.*?---", ""
    $content = $content.Trim()

@"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>$Title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="hero">
  <h1>$HeroTitle</h1>
  <p>$HeroSubtitle</p>
</header>

<nav class="nav">
  <a href="index.html">Home</a>
  <a href="services.html">Services</a>
  <a href="about.html">About</a>
  <a href="contact.html">Contact</a>
</nav>

<section class="section">
<pre>
$content
</pre>
</section>

<footer class="footer">
  © 2025 O.S. Electric • Buffalo, NY
</footer>

</body>
</html>
"@ | Out-File $HtmlFile -Encoding utf8
}

Convert-MdToHtmlPage `
    -MdFile "services.md" `
    -HtmlFile "services.html" `
    -Title "Electrical Services | O.S. Electric" `
    -HeroTitle "Our Services" `
    -HeroSubtitle "Reliable electrical solutions for home and business"

Convert-MdToHtmlPage `
    -MdFile "about.md" `
    -HtmlFile "about.html" `
    -Title "About O.S. Electric" `
    -HeroTitle "About O.S. Electric" `
    -HeroSubtitle "Over 20 years of trusted electrical experience"

Write-Host "Pages created successfully." -ForegroundColor Green
