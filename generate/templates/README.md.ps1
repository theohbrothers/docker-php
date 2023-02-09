@"
# docker-php

[![github-actions](https://github.com/theohbrothers/docker-php/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/docker-php/actions)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-php?style=flat-square)](https://github.com/theohbrothers/docker-php/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-php/latest)](https://hub.docker.com/r/theohbrothers/docker-php)

Dockerized php with php extension(s), based on [official php images](https://hub.docker.com/_/php).

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
$(
($VARIANTS | % {
    if ( $_['tag_as_latest'] ) {
@"
| ``:$( $_['tag'] )``, ``:latest`` | [View](variants/$( $_['tag'] )) |

"@
    }else {
@"
| ``:$( $_['tag'] )`` | [View](variants/$( $_['tag'] )) |

"@
    }
}) -join ''
)

"@

@'
## Development

Requires Windows `powershell` or [`pwsh`](https://github.com/PowerShell/PowerShell).

```powershell
# Install Generate-DockerImageVariants module: https://github.com/theohbrothers/Generate-DockerImageVariants
Install-Module -Name Generate-DockerImageVariants -Repository PSGallery -Scope CurrentUser -Force -Verbose

# Edit ./generate templates

# Generate the variants
Generate-DockerImageVariants .
```

'@
