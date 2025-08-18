# go-build

This action wraps common Go build container steps.

## Usage

Minimal usage (see input section below for more options).

```yaml
    - uses: mchmarny/common/go-build@main
      id: build  # Used when referencing the action outputs
      with:
        image-uri: github.com/${{ env.GITHUB_REPOSITORY }}
        release-version: ${{ github.ref_name }}
        registry-username: ${{ github.actor }}
        registry-password: ${{ secrets.GITHUB_TOKEN }}
```

## Inputs

```yaml
  image-uri:
    description: 'The URI of the resulting image (e.g. registry/repo/image-name, no tags.'
    required: true
  go-version:
    description: 'The version of Go to be used during build. Defaults to "1.25.0".'
    required: false
    default: '1.25.0'
  release-version:
    description: 'Image release version (aka tag) to set.'
    required: true
  main-path:
    description: 'Build entry path relative to the root of the repo. Default to main.go.'
    required: false
    default: 'main.go'
  registry-username:
    description: '(optional) Registry username. Defaults to the GitHub actor.'
    required: false
    default: ${{ github.actor }}
  registry-password:
    description: '(required) Registry password.'
    required: true
```

## Outputs:

```yaml
  image-uri:
    description: 'Fully qualified image URI after build (includes digest)'
    value: ${{ steps.image.outputs.uri }}
  image-digest:
    description: 'Image digest after build'
    value: ${{ steps.image.outputs.digest }}
  image-name:
    description: 'Image name (no digest or tag)'
    value: ${{ steps.image.outputs.name }}
  image-tag:
    description: 'Image tag used for the build (e.g. v1.0.0)'
    value: ${{ inputs.release-version }}
```