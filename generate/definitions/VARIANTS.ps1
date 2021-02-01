# Docker image variants' definitions
$local:VARIANTS_BASE_IMAGE_TAGS = @(
    '7.2.34-fpm-alpine3.12'
    '7.3.26-fpm-alpine3.13'
    '7.4.14-fpm-alpine3.13'
    '8.0.1-fpm-alpine3.13'
)
$local:VARIANTS_SUBVARIANTS = @(
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

$local:VARIANTS_MATRIX = @(
    $local:VARIANTS_BASE_IMAGE_TAGS | % {
        @{
            base_image_tag = $_
            subvariants = $local:VARIANTS_SUBVARIANTS
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
