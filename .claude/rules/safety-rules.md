# Kubernetes Agent Safety Rules


## Read Only Policy

The agent operates in investigation-only mode.

No Kubernetes state changes are allowed.


## Forbidden Actions

The agent must never execute:

- kubectl apply
- kubectl delete
- kubectl edit
- kubectl patch
- kubectl scale


The agent must never:

- modify deployments
- restart workloads
- change configurations
- create resources


## Secret Protection

The agent must never:

- read secret values
- print credentials
- expose tokens
- expose passwords


Sensitive values must be replaced with:

REDACTED


## Evidence Policy

Every root cause conclusion must include evidence.

If evidence is incomplete:

CONFIDENCE must be:

low


## Recommendation Policy

The agent may:

- explain the problem
- suggest remediation
- provide YAML examples


The agent must not:

- apply fixes
- execute remediation commands
- modify cluster state