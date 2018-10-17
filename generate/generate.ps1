$GENERATE_BASE_DIR = $PSScriptRoot
$TEMPLATES_DIR = Join-Path $GENERATE_BASE_DIR "templates"
$PROJECT_BASE_DIR = Split-Path $GENERATE_BASE_DIR -Parent

cd $GENERATE_BASE_DIR

$VARIANTS = @(
    @{
        name = 'gd'
        extensions = @(
            'gd'
        )
    }
    @{
        name = 'mysqli'
        extensions = @(
            'mysqli'
        )
    }
    @{
        name = 'mysqli-gd'
        extensions = @(
            'mysqli'
            'gd'
        )
    }
)

function Get-ContentFromTemplate {
    param(
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ Test-Path $_ })]
        [string]$Path
    ,
        [int]
        $PrependNewLines
    )
    $content = & $Path
    if ($PrependNewLines) {
        1..($PrependNewLine) | % {
            $content = "`n$content"
        }
    }
    $content
}

# Generate Dockerfiles
$VARIANTS | % {
    $VARIANT = $_
    $VARIANT_DIR = "$PROJECT_BASE_DIR/variants/$($VARIANT['name'])"

    "Generating variant of name $( $VARIANT['name'] ), variant dir: $VARIANT_DIR" | Write-Host -ForegroundColor Green
    $content = Get-ContentFromTemplate -Path "$TEMPLATES_DIR/Dockerfile-Begin.ps1"
    $VARIANT['extensions'] | % {
        $content += Get-ContentFromTemplate -Path "$TEMPLATES_DIR/$_/$_.ps1" -PrependNewLines 2
    }
    $content += Get-ContentFromTemplate -Path "$TEMPLATES_DIR/Dockerfile-End.ps1" -PrependNewLines 2
    $content | Out-File "$VARIANT_DIR/Dockerfile" -Encoding Utf8 -Force -NoNewline
}