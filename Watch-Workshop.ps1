# Watch-Workshop.ps1
# This script monitors images/students and updates index.html automatically.

$Watcher = New-Object System.IO.FileSystemWatcher
$Watcher.Path = "$PSScriptRoot\images\students"
$Watcher.Filter = "*.*"
$Watcher.IncludeSubdirectories = $false
$Watcher.EnableRaisingEvents = $true

$UpdateAction = {
    Write-Host "📸 Change detected in students folder. Updating Dashboard..." -ForegroundColor Cyan
    
    $Images = Get-ChildItem -Path "$PSScriptRoot\images\students" -File
    $HtmlContent = ""

    foreach ($Img in $Images) {
        $Name = [System.IO.Path]::GetFileNameWithoutExtension($Img.Name)
        $Path = "images/students/$($Img.Name)"
        
        # Professional bio templates
        $Bios = @(
            "Cloud Infrastructure specialist focusing on high-availability systems and security.",
            "Software Architect passionate about clean code and scalable microservices.",
            "DevOps Engineer streamlining CI/CD pipelines and developer productivity.",
            "Technical Lead with expertise in automation and system integration."
        )
        $Bio = $Bios[($Name.Length % $Bios.Count)]

        $HtmlContent += @"
                <!-- Profile: $Name -->
                <div class="profile-card">
                    <img src="$Path" alt="$Name" onerror="this.src='https://via.placeholder.com/80?text=$($Name[0])'">
                    <div>
                        <h3>$Name</h3>
                        <p>$Bio</p>
                    </div>
                </div>
"@
    }

    $IndexFile = "$PSScriptRoot\index.html"
    $Content = Get-Content $IndexFile -Raw
    
    $Pattern = "(?s)<!-- START_PARTICIPANTS -->.*?<!-- END_PARTICIPANTS -->"
    $Replacement = "<!-- START_PARTICIPANTS -->`n$HtmlContent`n                <!-- END_PARTICIPANTS -->"
    
    $NewContent = [regex]::Replace($Content, $Pattern, $Replacement)
    $NewContent | Set-Content $IndexFile
    
    Write-Host "✅ Dashboard updated successfully!" -ForegroundColor Green
}

# Run once at startup
& $UpdateAction

# Register events for future changes
Register-ObjectEvent $Watcher "Created" -Action $UpdateAction
Register-ObjectEvent $Watcher "Deleted" -Action $UpdateAction
Register-ObjectEvent $Watcher "Renamed" -Action $UpdateAction

Write-Host "👀 Watching for student photos in images/students/..." -ForegroundColor Yellow
Write-Host "Press Ctrl+C to stop the watcher."

# Keep script running
while($true) { Start-Sleep -Seconds 1 }
