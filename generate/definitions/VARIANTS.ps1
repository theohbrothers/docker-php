# Docker image variants' definitions
# See: https://www.php.net/releases/index.php?json&max=100&version=8.2
$local:VARIANTS_BASE_IMAGE_TAGS = @(
    '8.2.5-fpm-alpine3.17'
    '8.1.17-fpm-alpine3.17'
    '8.0.28-fpm-alpine3.16'
    '7.4.33-fpm-alpine3.16'
    '7.3.33-fpm-alpine3.15'
    '7.2.34-fpm-alpine3.12'
)
$local:VARIANTS_MATRIX = @(
    $local:VARIANTS_BASE_IMAGE_TAGS | % {
        @{
            base_image_tag = $_
            subvariants = @(
                @{ components = @() }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'memcached', 'sockets' ) }
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
                tag_as_latest = if ($variant['base_image_tag'] -eq $local:VARIANTS_MATRIX[0]['base_image_tag'] -and $subVariant['components'].Count -eq 0) { $true } else { $false }
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
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
        }
    }
}
