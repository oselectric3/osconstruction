# =========================================
# O.S. Electric Website Builder
# Editorial Design + Color Upgrade
# =========================================

$siteRoot = "D:\OSelectric website"
$indexFile = Join-Path $siteRoot "index.html"
$cssDir = Join-Path $siteRoot "css"
$cssFile = Join-Path $cssDir "style.css"

Write-Host "RUNNING EDITORIAL SITE BUILD" -ForegroundColor Cyan

Set-Location $siteRoot

# -------------------------------
# Ensure CSS folder exists
# -------------------------------
if (!(Test-Path $cssDir)) {
    New-Item -ItemType Directory -Path $cssDir | Out-Null
    Write-Host "Created css folder"
}

# -------------------------------
# Write modern editorial CSS
# -------------------------------
@"
@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&family=Inter:wght@300;400;600&display=swap');

:root {
  --primary: #0b3c5d;
  --accent: #f2b705;
  --dark: #1b1b1b;
  --light: #f4f6f8;
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: 'Inter', Arial, sans-serif;
  background: var(--light);
  color: #333;
  line-height: 1.7;
}

h1, h2, h3 {
  font-family: 'Libre Baskerville', Georgia, serif;
  color: var(--primary);
  margin-top: 0;
}

.hero {
  background: linear-gradient(rgba(11,60,93,0.85), rgba(11,60,93,0.85)),
              url('https://images.unsplash.com/photo-1581092919534-3d0a5f6f1f59');
  background-size: cover;
  background-position: center;
  color: white;
  padding: 110px 20px;
  text-align: center;
}

.hero h1 {
  font-size: 3rem;
  color: white;
}

.hero p {
  font-size: 1.2rem;
  max-width: 700px;
  margin: 20px auto 30px;
}

.hero .btn {
  background: var(--accent);
  color: #000;
  padding: 14px 30px;
  text-decoration: none;
  font-weight: 600;
  border-radius: 4px;
}

.nav {
  background: white;
  padding: 18px;
  text-align: center;
  box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

.nav a {
  margin: 0 18px;
  text-decoration: none;
  color: var(--primary);
  font-weight: 600;
}

.section {
  padding: 70px 20px;
  max-width: 1100px;
  margin: auto;
}

.services {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 30px;
  margin-top: 40px;
}

.card {
  background: white;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

.card h3 {
  margin-bottom: 10px;
}

.footer {
  background: var(--dark);
  color: #bbb;
  text-align: center;
  padding: 30px 20px;
  font-size: 0.9rem;
}
"@ | Set-Content $cssFile -Encoding utf8

Write-Host "style.css created with editorial design"

# -------------------------------
# Backup index.html
# -------------------------------
Copy-Item $indexFile "$indexFile.bak" -Force
Write-Host "index.html backed up"

# -------------------------------
# Write clean editorial index.html
# -------------------------------
@"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>O.S. Electric | Buffalo Electricians</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Licensed electricians serving Buffalo, NY with over 20 years of experience.">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="hero">
  <h1>Powering Your World, Safely & Efficiently</h1>
  <p>
    O.S. Electric is a trusted electrical contractor serving Buffalo, NY,
    delivering safe, modern, and reliable electrical solutions.
  </p>
  <a href="#contact" class="btn">Request Service</a>
</header>

<nav class="nav">
  <a href="index.html">Home</a>
  <a href="services.html">Services</a>
  <a href="about.html">About</a>
</nav>

<section class="section">
  <h2>Our Commitment</h2>
  <p>
    With over 20 years of experience, O.S. Electric is committed to quality
    craftsmanship, safety-first practices, and dependable service for every client.
  </p>
</section>

<section class="section">
  <h2>Electrical Services</h2>

  <div class="services">
    <div class="card">
      <h3>Installations</h3>
      <p>Code-compliant installations for new construction and system upgrades.</p>
    </div>

    <div class="card">
      <h3>Repairs & Maintenance</h3>
      <p>Efficient troubleshooting and long-term electrical solutions.</p>
    </div>

    <div class="card">
      <h3>Lighting Solutions</h3>
      <p>Interior and exterior lighting designed for efficiency and style.</p>
    </div>

    <div class="card">
      <h3>Backup Power</h3>
      <p>Generator and backup systems to protect against outages.</p>
    </div>
  </div>
</section>

<section class="section" id="contact">
  <h2>Contact O.S. Electric</h2>
  <p><strong>Phone:</strong> (716) 570-3363</p>
  <p><strong>Email:</strong> oselectric3@gmail.com</p>
  <p><strong>Location:</strong> Buffalo, NY</p>
</section>

<footer class="footer">
  © 2025 O.S. Electric • Licensed • Experienced • Reliable
</footer>

</body>
</html>
"@ | Set-Content $indexFile -Encoding utf8

Write-Host "index.html rebuilt with editorial layout" -ForegroundColor Green

