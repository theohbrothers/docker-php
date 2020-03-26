# Docker image variants' definitions
$local:VARIANTS_MATRIX = @(
    '7.2.29-fpm-alpine3.10' | % {
        @{
            base_image_tag = $_
            subvariants = @(
                @{ components = @( 'opcache' ) }
                @{ components = @( 'mysqli' ) }
                @{ components = @( 'gd' ) }
                @{ components = @( 'pdo' ) }
                @{ components = @( 'memcached' ) }
                @{ components = @( 'sockets' ) }
                @{ components = @( 'xdebug' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'memcached' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'memcached', 'sockets' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'xdebug' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'xdebug' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'memcached', 'xdebug' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'memcached', 'sockets', 'xdebug' ) }
            )
        }
    }
    '7.3.16-fpm-alpine3.11' | % {
        @{
            base_image_tag = $_
            subvariants = @(
                @{ components = @( 'opcache' ) }
                @{ components = @( 'mysqli' ) }
                @{ components = @( 'gd' ) }
                @{ components = @( 'pdo' ) }
                @{ components = @( 'memcached' ) }
                @{ components = @( 'sockets' ) }
                @{ components = @( 'xdebug' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'memcached' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'memcached', 'sockets' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'xdebug' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'xdebug' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'memcached', 'xdebug' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'memcached', 'sockets', 'xdebug' ) }
            )
        }
    }
)
$VARIANTS = @(
    foreach ($variant in $VARIANTS_MATRIX){
        foreach ($subVariant in $variant['subvariants']) {
            @{
                # Metadata object
                _metadata = @{
                    base_image_tag = $variant['base_image_tag']
                    components = $subVariant['components']
                }
                # Docker image tag. E.g. '7.2-fpm-alpine3.10-opcache', '7.2-fpm-alpine3.10-mysqli'
                tag = @(
                    $variant['base_image_tag']
                    $subVariant['components'] | ? { $_ }
                ) -join '-'
                tag_as_latest = if ( $subVariant.Contains('tag_as_latest') ) {
                                    $subVariant['tag_as_latest']
                                } else {
                                    $false
                                }
            }
        }
    }
)

# Docker image variants' definitions (shared)
$VARIANTS_SHARED = @{
    buildContextFiles = @{
        templates = @{
            'Dockerfile' = @{
                common = $true
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
