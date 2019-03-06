# Docker image variants' definitions
$VARIANTS_VERSION = "1.0.4a"
$VARIANTS = @(
    @{
        tag = 'opcache'
        distro = 'alpine'
    }
    @{
        tag = 'mysqli'
        distro = 'alpine'
    }
    @{
        tag = 'gd'
        distro = 'alpine'
    }
    @{
        tag = 'pdo'
        distro = 'alpine'
    }
    @{
        tag = 'memcached'
        distro = 'alpine'
    }
    @{
        tag = 'xdebug'
        distro = 'alpine'
    }
    @{
        tag = 'opcache-mysqli-gd'
        distro = 'alpine'
    }
    @{
        tag = 'opcache-mysqli-gd-pdo'
        distro = 'alpine'
    }
    @{
        tag = 'opcache-mysqli-gd-pdo-memcached'
        distro = 'alpine'
    }
    @{
        tag = 'opcache-mysqli-gd-xdebug'
        distro = 'alpine'
    }
    @{
        tag = 'opcache-mysqli-gd-pdo-xdebug'
        distro = 'alpine'
    }
    @{
        tag = 'opcache-mysqli-gd-pdo-memcached-xdebug'
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