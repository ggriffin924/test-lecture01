# Watch-Workshop.ps1
# This script monitors images/students and updates index.html automatically.

$Watcher = New-Object System.IO.FileSystemWatcher
$Watcher.Path = "$PSScriptRoot\images\students"
$Watcher.Filter = "*.*"
$Watcher.IncludeSubdirectories = $false
$Watcher.EnableRaisingEvents = $true

$UpdateAction = {
    Write-Host "Change detected in students folder. Updating Dashboard..." -ForegroundColor Cyan
    
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

        $HtmlContent += "`n                <!-- Profile: $Name -->"
        $HtmlContent += "`n                <div class='profile-card'>"
        $HtmlContent += "`n                    <img src='$Path' alt='$Name' onerror=`"this.src='https://via.placeholder.com/80?text=$($Name[0])'`">"
        $HtmlContent += "`n                    <div>"
        $HtmlContent += "`n                        <h3>$Name</h3>"
        $HtmlContent += "`n                        <p>$Bio</p>"
        $HtmlContent += "`n                    </div>"
        $HtmlContent += "`n                </div>"
    }

    $IndexFile = "$PSScriptRoot\index.html"
    if (Test-Path $IndexFile) {
        # Force reading as UTF8 to preserve emojis
        $Content = [System.IO.File]::ReadAllText($IndexFile, [System.Text.Encoding]::UTF8)
        
        $Pattern = "(?s)<!-- START_PARTICIPANTS -->.*?<!-- END_PARTICIPANTS -->"
        $Replacement = "<!-- START_PARTICIPANTS -->$HtmlContent`n                <!-- END_PARTICIPANTS -->"
        
        $NewContent = [regex]::Replace($Content, $Pattern, $Replacement)
        
        # Write as UTF8 without BOM to keep browser and editor happy
        $Utf8NoBom = New-Object System.Text.UTF8Encoding($false)
        [System.IO.File]::WriteAllText($IndexFile, $NewContent, $Utf8NoBom)
        
        Write-Host "Dashboard updated successfully!" -ForegroundColor Green
    } else {
        Write-Host "Error: index.html not found at $IndexFile" -ForegroundColor Red
    }
}

# Run once at startup
& $UpdateAction

# Register events for future changes
$CreatedEvent = Register-ObjectEvent $Watcher "Created" -Action $UpdateAction
$DeletedEvent = Register-ObjectEvent $Watcher "Deleted" -Action $UpdateAction
$RenamedEvent = Register-ObjectEvent $Watcher "Renamed" -Action $UpdateAction

Write-Host "Watching for student photos in images/students/..." -ForegroundColor Yellow
Write-Host "Press Ctrl+C to stop the watcher."

# Keep script running
try {
    while($true) { Start-Sleep -Seconds 1 }
} finally {
    # Cleanup events on exit
    Get-EventSubscriber | Where-Object { $_.Action -eq $UpdateAction } | Unregister-Event
}
