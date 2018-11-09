# Docker image variants' definitions
$VARIANTS_VERSION = "1.0.1a"
$VARIANTS = @(
    @{
        tag = 'gd'
        distro = 'alpine'
    }
    @{
        tag = 'mysqli'
        distro = 'alpine'
    }
    @{
        tag = 'xdebug'
        distro = 'alpine'
    }
    @{
        tag = 'mysqli-gd'
        distro = 'alpine'
    }
    @{
        tag = 'mysqli-gd-xdebug'
        distro = 'alpine'
    }
)

# Docker image variants' definitions (shared)
$VARIANTS_SHARED = @{
    version = $VARIANTS_VERSION
    buildContextFiles = @{
        templates = @{
            'Dockerfile' = @{
                common = $false
                includeHeader = $true
                includeFooter = $true
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
        }
    }
}

# Send definitions down the pipeline
$VARIANTS