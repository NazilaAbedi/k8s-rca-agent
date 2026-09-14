# Kubernetes RCA Skill


## Purpose

Investigate Kubernetes namespace failures using read-only Kubernetes MCP tools.

The goal is to identify the root cause based on collected evidence.


## Allowed MCP Tools

The agent may use only:

- kubectl_get
- kubectl_describe
- kubectl_logs


The agent must not use:

- kubectl_apply
- kubectl_delete
- kubectl_create
- kubectl_patch
- kubectl_scale
- kubectl_rollout
- exec_in_pod


## Investigation Workflow


## 1. Inspect Pods

Use:

kubectl_get


Parameters:

resourceType: pods

namespace: target namespace


Analyze:

- pod status
- restart count
- container state


Identify:

- CrashLoopBackOff
- ImagePullBackOff
- Pending
- OOMKilled


---

## 2. Inspect Kubernetes Events

Use:

kubectl_get


Parameters:

resourceType: events

namespace: target namespace


Look for:

- scheduling failures
- image pull failures
- probe failures
- volume problems


---

## 3. Describe Failed Resources

Use:

kubectl_describe


Inspect:

- container state
- failure reason
- environment variables
- probes
- resource limits


---

## 4. Inspect Logs

Use:

kubectl_logs


For crashed containers:

previous: true


Look for:

- application crashes
- configuration errors
- dependency failures


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
- environment variables
- replicas
- resources


---

## 6. Service Investigation

Inspect:

- services
- endpoints


Identify:

- missing selectors
- unavailable backends


---

## 7. Root Cause Analysis

Do not conclude without evidence.


Final response must contain:


ROOT CAUSE:

EVIDENCE:

CONFIDENCE:

PROPOSED PATCH:


Never apply remediation.