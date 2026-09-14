# Kubernetes RCA Request


## Target Namespace

{{NAMESPACE}}


## Task

Investigate the Kubernetes namespace above.

Find the root cause of the failure and propose a safe remediation.

The investigation must be evidence-driven.


## Requirements

- Collect evidence before making conclusions.
- Use available Kubernetes investigation tools.
- Follow the Kubernetes RCA workflow.
- Do not modify cluster resources.
- Do not expose sensitive information.
- Do not assume the root cause without supporting evidence.


## Investigation Focus

Analyze:

- Pod status
- Kubernetes events
- Resource descriptions
- Container logs
- Deployment configuration
- Service and endpoint state
- Metrics when available


## Expected Output


ROOT CAUSE:

Describe the most likely root cause.


EVIDENCE:

List observations that support the conclusion.

Format:

- observation -> source


CONFIDENCE:

high | medium | low


PROPOSED PATCH:

Provide a remediation example.

Do not apply it.