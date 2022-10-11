param (
    [string] $prompt,
    [int] $iterations = 4,
    [int] $width = 512,
    [int] $height = 512,
    [string] $dir = "$env:UserProfile/Pictures",
    [switch] $multi = $false,
    [switch] $open = $false
)

if ( !(Test-Path -Path $dir) ){
    throw "Invalid output directory @ $dir"
}

# System parameters
$conda_location = "C:/tools/Anaconda3"
$conda_hook = "C:/tools/Anaconda3/shell/condabin/conda-hook.ps1"
$sd_location = "C:/tools/stable-diffusion/stable-diffusion-main"
$txt_2_img_location = "${sd_location}/scripts/txt2img.py"

$current_location = Get-Location
$samples = 1

if ($multi) {
    $samples = 2
}

# Execute as Conda shell
. "$conda_hook"
conda activate $conda_location
Set-Location $sd_location
conda activate ldm

$script_output = python $txt_2_img_location --prompt $prompt --n_iter $iterations --n_samples $samples --W $width --H $height --outdir $dir

# Get output directory from console output
if ($open){
    $result_location = $script_output | Select-Object -last 1
    Write-Host "Files at $result_location" -ForegroundColor DarkYellow
    Set-Location $result_location
    explorer .
}

# Drop output
$script_output = $null

# Deactivate conda
conda deactivate
conda deactivate
Set-Location $current_location

Write-Host "Done :)" -ForegroundColor Blue
