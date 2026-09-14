# Kubernetes RCA Skill


## Purpose

This skill defines the standard workflow for Kubernetes Root Cause Analysis.


## Workflow


## 1. Namespace Discovery

Identify the target namespace.

Understand:

- workloads
- services
- dependencies


## 2. Pod Investigation

Inspect pods.

Analyze:

- status
- restart count
- container state
- readiness
- failures


Look for:

- CrashLoopBackOff
- ImagePullBackOff
- Pending
- OOMKilled


## 3. Event Analysis

Inspect Kubernetes events.

Look for:

- scheduling failures
- image pull problems
- probe failures
- volume issues
- resource limitations


## 4. Resource Description

Inspect unhealthy resources.

Analyze:

- environment variables
- probes
- resource limits
- container configuration


## 5. Log Investigation

Analyze application logs.

Look for:

- startup failures
- exceptions
- dependency failures
- configuration errors


## 6. Deployment Analysis

Review:

- container images
- configuration
- environment variables
- resource requests/limits


## 7. Service Investigation

Check:

- services
- selectors
- endpoints
- connectivity


## 8. Metrics Correlation

When metrics are available analyze:

- CPU usage
- Memory usage
- Error rate
- Latency


## 9. Root Cause Generation

Only generate conclusions after evidence collection.


The final answer must contain:

ROOT CAUSE:

EVIDENCE:

CONFIDENCE:

PROPOSED PATCH:


Never apply fixes.