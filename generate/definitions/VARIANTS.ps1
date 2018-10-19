# Docker image variants' definitions
$VARIANTS_VERSION = "1.0.0"
$VARIANTS = @(
    @{
        name = 'gd'
        includeEntrypointScript = $false
    }
    @{
        name = 'mysqli'
        includeEntrypointScript = $false
    }
    @{
        name = 'mysqli-gd'
        includeEntrypointScript = $false
    }
)

# Intelligently add properties
$VARIANTS | % {
    $_['version'] = $VARIANTS_VERSION
    $_['extensions'] = $_['name'] -split '-' | ? { $_.Trim() }
}

# Send definitions down the pipeline
$VARIANTS