# Fix Backend CVEs

Fix all vulnerabilities in the pipeline runner Docker image using systematic vulnerability scanning and remediation.

## CONTEXT

- The source code and Dockerfile for this image are in the root folder of the repo
- The vulnerability scanning script is at `trivy/scan.sh`, referenced by the `okteto test trivy` test container
- Focus on CRITICAL and HIGH severity vulnerabilities first, then address medium/low as needed

## WORKFLOW

### 1. Build and Scan Process

- Rebuild the image: `okteto build` (do not use `--no-cache` unless necessary)
- Scan for vulnerabilities: `okteto test trivy`
- Analyze scan results to identify specific packages and CVEs that need attention

### 2. Vulnerability Remediation

- Repeat the build and scan process after each set of changes
- Continue until all CRITICAL and HIGH vulnerabilities are resolved or you cannot fix more CVEs

## PULL REQUEST REQUIREMENTS

If you did any change, create a PR for vulnerability fixes

### Required Content

- **Clear status statement**: First line must clearly state whether ALL CRITICAL/HIGH vulnerabilities have been fixed or not
- **Before/after scans**: Include trivy scan results before and after changes using:
  ```
  okteto test trivy
  ```
- **Summary of changes**: List specific packages updated, base image changes, etc.
