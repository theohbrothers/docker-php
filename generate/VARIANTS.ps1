# Variants' definition
$VARIANTS_VERSION = "1.0.0"
$VARIANTS = @(
    @{
        name = 'gd'
    }
    @{
        name = 'mysqli'
    }
    @{
        name = 'mysqli-gd'
    }
)

# Intelligently add properties
$VARIANTS | % {
    $_['version'] = $VARIANTS_VERSION
    $_['extensions'] = $_['name'] -split '-' | ? { $_.Trim() }
}

# Send definitions down the pipeline
$VARIANTS