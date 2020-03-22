[CmdletBinding()]
param (
  # Image ID
  [Parameter(Mandatory)]
  [string]
  $imageId,
  # Image tag
  [Parameter(Mandatory)]
  [string]
  $fullTag
)

$owner = "gruppone"
$repo = "chktex-action"

docker tag $imageId "docker.pkg.github.com/$owner/$repo/$fullTag"
docker push "docker.pkg.github.com/$owner/$repo/$fullTag"
