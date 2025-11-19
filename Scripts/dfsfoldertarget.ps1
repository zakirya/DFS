# Run in a PowerShell session with DFS Management Tools installed

# DFS namespace root
$namespaceRoot = "\\fqm.internal\expl\SPATIAL\SRC\NAmerica\CANNunavat"

# Local base path where the folders currently live
$sourceRoot   = "H:\EXPL\Spatial\SRC\NAmerica\CANNunavat"

# Fileserver that hosts the shares
$targetServer = "ZURSRVPFS03"   # <-- change this

# Pattern of the share name:
#   SD_SRC_NAmerica_CANAtlantic_FOLDERNAMEHERE$
# We'll build it dynamically from the folder name.
$sharePrefix  = "SD_SRC_NAmerica_CANNunavat_"
$shareSuffix  = "$"

# Make sure the module is available
Import-Module DFSN -ErrorAction Stop

Get-ChildItem -Path $sourceRoot -Directory | ForEach-Object {
    $folderName = $_.Name

    # DFS folder path (what users see)
    $dfsnPath   = Join-Path $namespaceRoot $folderName

    # Share name and full UNC target
    $shareName  = "$sharePrefix$folderName$shareSuffix"
    $targetPath = "\\{0}\{1}" -f $targetServer, $shareName

    Write-Host "Creating DFS folder $dfsnPath -> $targetPath"

    # Create the DFS folder (if it doesn't exist) and add the target
    if (-not (Get-DfsnFolder -Path $dfsnPath -ErrorAction SilentlyContinue)) {
        New-DfsnFolder -Path $dfsnPath -TargetPath $targetPath -State Online -Description $folderName
    }
    else {
        # DFS folder exists, just add the target
        New-DfsnFolderTarget -Path $dfsnPath -TargetPath $targetPath -ErrorAction SilentlyContinue
    }
}
