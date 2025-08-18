# go-test

This action wraps common Go testing, linting, and vulnerability scanning steps.

## Usage

Minimal usage (see input section below for more options).

```yaml
    - uses: mchmarny/common/go-test@main
      with:
        scan-severity: 'CRITICAL,HIGH'
        yaml-linter-config-path: .yamllint
        go-linter-config-path: .golangci.yaml
```

## Inputs

```yaml
  go-version:
    description: 'Version of Go to use. Defaults to "1.25.0".'
    required: false
    default: '1.25.0'
  scan-severity:
    description: 'Trivy scan severity. Defaults to "CRITICAL,HIGH".'
    required: false
    default: 'CRITICAL,HIGH'
  linter-version:
    description: 'Version of golangci-lint to use. Defaults to v2.4.0.'
    required: false
    default: v2.4.0
  yaml-linter-config-path:
    description: 'Path to the YAML linter config file. Defaults to .yamllint.'
    required: false
    default: '.yamllint'
  go-linter-config-path:
    description: 'Path to the Go linter config file. Defaults to .golangci.yaml.'
    required: false
    default: '.golangci.yaml'
```

