# Docker image variants' definitions
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
        tag = 'sockets'
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
        tag = 'opcache-mysqli-gd-pdo-memcached-sockets'
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
    @{
        tag = 'opcache-mysqli-gd-pdo-memcached-sockets-xdebug'
        distro = 'alpine'
    }
)

# Docker image variants' definitions (shared)
$VARIANTS_SHARED = @{
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
