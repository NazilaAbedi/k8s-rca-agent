# Kubernetes RCA Skill


## Purpose

Investigate Kubernetes namespace failures using read-only Kubernetes MCP tools.

The goal is to identify the root cause based on collected evidence.

The agent must investigate before making conclusions.


## Available MCP Tools (Read-Only)

The agent may use:

- kubectl_get
  - Inspect Kubernetes resources:
    - pods
    - events
    - deployments
    - services
    - endpoints
    - configmaps

- kubectl_describe
  - Inspect detailed resource information:
    - status
    - conditions
    - container state
    - events
    - resource limits

- kubectl_logs
  - Retrieve container logs.
  - Use previous=true for crashed or restarted containers.

- explain_resource
  - Use only when an unfamiliar Kubernetes field needs explanation.

- list_api_resources
  - Use only for discovering unknown CRDs.

- ping
  - Use only to verify MCP connectivity.
  - Never use for diagnosis.


## Forbidden Actions

The agent must never modify Kubernetes resources.

Forbidden actions:

- kubectl_apply
- kubectl_delete
- kubectl_create
- kubectl_patch
- kubectl_scale
- kubectl_rollout
- exec_in_pod


The agent operates in read-only investigation mode.


# Mandatory Troubleshooting Workflow

Follow this order. Do not skip steps before forming a hypothesis.


## 1. Inspect Pods

Use:

kubectl_get

Parameters:

resourceType: pods

namespace: target namespace


Check:

- pod status
- restart count
- container state

Identify:

- CrashLoopBackOff
- ImagePullBackOff
- Pending
- OOMKilled


Record evidence:

tool -> finding


---


## 2. Inspect Events

Use:

kubectl_get

Parameters:

resourceType: events

namespace: target namespace


Look for:

- image pull failures
- scheduling failures
- probe failures
- volume issues
- permission errors


Record evidence:

tool -> finding


---


## 3. Describe Failed Resources

Use:

kubectl_describe


Inspect:

- failure reason
- container state
- conditions
- probes
- environment variables
- resource limits
- event history


Record evidence:

tool -> finding


---


## 4. Inspect Logs

Use:

kubectl_logs


For restarted containers:

previous=true


Look for:

- application crashes
- configuration errors
- dependency failures


Record evidence:

tool -> finding


---


## 5. Inspect Configuration

Use:

kubectl_get


Inspect:

- deployments
- services
- configmaps


Analyze:

- container image
- image tag
- environment variables
- replicas
- resources


Record evidence:

tool -> finding


---


## 6. Service Investigation

Inspect:

- services
- endpoints


Identify:

- missing selectors
- unavailable backends
- routing problems


Record evidence:

tool -> finding


# Root Cause Rules

Do not conclude without evidence.

The root cause must be supported by collected observations.

If evidence is insufficient:

- Do not guess.
- Set confidence to low.


# Final Response Format

The final answer MUST contain ONLY these sections:


ROOT CAUSE:

<one sentence>


EVIDENCE:

- <tool used> -> <finding>

- <tool used> -> <finding>


CONFIDENCE:

high | medium | low


PROPOSED PATCH:

<YAML only>


# Output Rules

- Do not add summaries.
- Do not add tables.
- Do not add extra sections.
- Do not explain investigation steps.
- Do not include kubectl commands.
- Do not include operator instructions.
- Do not include prevention recommendations.
- Do not apply remediation.
- After PROPOSED PATCH, output YAML only. Do not add notes, explanations, warnings, or operator instructions.