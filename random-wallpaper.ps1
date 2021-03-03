#====================
# Settings
#====================
$superSampling = 2
$urlTemplate = "https://picsum.photos/{width}/{height}?grayscale"

#====================
# Await connection
#====================
$null = $urlTemplate -match "^https?://([^/]*)/"
while(-Not (Test-Connection -Count 1 -ComputerName $Matches.1 -Quiet)) {
    Sleep -Seconds 60
}

#====================
# Update wallpaper
#====================
$videoModeDescription = (Get-WmiObject -Class Win32_VideoController).VideoModeDescription -split " x "
$width = ($videoModeDescription[0] -as [int]) * $superSampling
$height = ($videoModeDescription[1] -as [int]) * $superSampling
$url = $urlTemplate.Replace("{width}", $width).Replace("{height}", $height)
$filename = [Environment]::GetFolderPath("MyPictures") + "\wallpaper.png"
Invoke-WebRequest $url -OutFile $filename
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallPaper -Value $filename
# Force wallpaper update
Sleep -Seconds 5
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True
