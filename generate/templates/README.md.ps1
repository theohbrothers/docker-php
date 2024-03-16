@"
# docker-php

[![github-actions](https://github.com/theohbrothers/docker-php/actions/workflows/ci-master-pr.yml/badge.svg?branch=master)](https://github.com/theohbrothers/docker-php/actions/workflows/ci-master-pr.yml)
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

### Variant versions

[versions.json](generate/definitions/versions.json) contains a list of [Semver](https://semver.org/) versions, one per line.

To update versions in `versions.json`:

```powershell
./Update-Versions.ps1
```

To update versions in `versions.json`, and open a PR for each changed version, and merge successful PRs one after another (to prevent merge conflicts), and finally create a tagged release and close milestone:

```powershell
$env:GITHUB_TOKEN = 'xxx'
./Update-Versions.ps1 -PR -AutoMergeQueue -AutoRelease
```

To perform a dry run, use `-WhatIf`.

'@
