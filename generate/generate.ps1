# This script generates the variants' Docker build context files' in ./variants/<variant>

$GENERATE_BASE_DIR = $PSScriptRoot
$TEMPLATES_DIR = Join-Path $GENERATE_BASE_DIR "templates"
$PROJECT_BASE_DIR = Split-Path $GENERATE_BASE_DIR -Parent

cd $GENERATE_BASE_DIR

# Get variants' definition
$VARIANTS = & "./VARIANTS.ps1"

function Get-ContentFromTemplate {
    param(
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ Test-Path $_ })]
        [string]$Path
    ,
        [int]$PrependNewLines
    )
    $content = & $Path
    if ($PrependNewLines) {
        1..($PrependNewLine) | % {
            $content = "`n$content"
        }
    }
    $content
}

# Generate Variants' Dockerfile(s)
$VARIANTS | % {
    $VARIANT = $_
    $VARIANT_DIR = "$PROJECT_BASE_DIR/variants/$($VARIANT['name'])"

    "Generating variant of name $( $VARIANT['name'] ), variant dir: $VARIANT_DIR" | Write-Host -ForegroundColor Green
    $content = Get-ContentFromTemplate -Path "$TEMPLATES_DIR/Dockerfile.begin.ps1"
    $VARIANT['extensions'] | % {
        $content += Get-ContentFromTemplate -Path "$TEMPLATES_DIR/variants/$_/$_.ps1" -PrependNewLines 2
    }
    $content += Get-ContentFromTemplate -Path "$TEMPLATES_DIR/Dockerfile.end.ps1" -PrependNewLines 2
    $content | Out-File "$VARIANT_DIR/Dockerfile" -Encoding Utf8 -Force -NoNewline
}

# Generate README.md
$content = Get-ContentFromTemplate -Path "$TEMPLATES_DIR/README.md.ps1"
$content | Out-File "$PROJECT_BASE_DIR/README.md" -Encoding utf8 -NoNewline

# Generate .gitlab-ci.yml
$content = Get-ContentFromTemplate -Path "$TEMPLATES_DIR/.gitlab-ci.yml.ps1"
$content | Out-File "$PROJECT_BASE_DIR/.gitlab-ci.yml" -Encoding utf8 -NoNewline