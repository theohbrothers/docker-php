# This script generates the each Docker image variants' build context files' in ./variants/<variant>

$GENERATE_BASE_DIR = $PSScriptRoot
$TEMPLATES_DIR = Join-Path $GENERATE_BASE_DIR "templates"
$PROJECT_BASE_DIR = Split-Path $GENERATE_BASE_DIR -Parent

$ErrorActionPreference = 'Stop'

cd $GENERATE_BASE_DIR

# Get variants' definition
$VARIANTS = & "./VARIANTS.ps1"

function Get-ContentFromTemplate {
    param (
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ Test-Path $_ })]
        [string]$Path
    ,
        [ValidateRange(1,100)]
        [int]$PrependNewLines
    )
    $content = & $Path
    if ($PrependNewLines -gt 0) {
        1..($PrependNewLine) | % {
            $content = "`n$content"
        }
    }
    $content
}

# Generate each Docker image variant's build context files
$VARIANTS | % {
    $VARIANT = $_
    $VARIANT_DIR = "$PROJECT_BASE_DIR/variants/$($VARIANT['name'])"

    "Generating variant of name $( $VARIANT['name'] ), variant dir: $VARIANT_DIR" | Write-Host -ForegroundColor Green
    if ( ! (Test-Path $VARIANT_DIR) ) {
        New-Item -Path $VARIANT_DIR -ItemType Directory -Force > $null
    }

    # Generate Dockerfile
    & {
        Get-ContentFromTemplate -Path "$TEMPLATES_DIR/Dockerfile.begin.ps1"
        $VARIANT['extensions'] | % {
            Get-ContentFromTemplate -Path "$TEMPLATES_DIR/variants/$_/$_.ps1" -PrependNewLines 2
        }
        Get-ContentFromTemplate -Path "$TEMPLATES_DIR/Dockerfile.end.ps1" -PrependNewLines 2
    } | Out-File "$VARIANT_DIR/Dockerfile" -Encoding Utf8 -Force -NoNewline

    # Generate docker-entrypoint.sh
    #Get-ContentFromTemplate -Path "$TEMPLATES_DIR/docker-entrypoint.sh.ps1" | Out-File "$VARIANT_DIR/docker-entrypoint.sh" -Encoding Utf8 -Force -NoNewline
}

# Generate README.md
Get-ContentFromTemplate -Path "$TEMPLATES_DIR/README.md.ps1" | Out-File "$PROJECT_BASE_DIR/README.md" -Encoding utf8 -NoNewline

# Generate .gitlab-ci.yml
Get-ContentFromTemplate -Path "$TEMPLATES_DIR/.gitlab-ci.yml.ps1" | Out-File "$PROJECT_BASE_DIR/.gitlab-ci.yml" -Encoding utf8 -NoNewline