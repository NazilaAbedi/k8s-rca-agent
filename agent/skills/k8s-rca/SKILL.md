# Kubernetes RCA Workflow


## Goal

Find root cause of a broken namespace.


## Step 1: Check Pods

Use Kubernetes MCP.

Tool:

kubectl_get


Arguments:

resourceType: pods
namespace: target namespace


Look for:

- CrashLoopBackOff
- ImagePullBackOff
- Pending
- OOMKilled


## Step 2: Check Events

Use:

kubectl_get

resourceType:
events


Look for:

- scheduling failures
- image errors
- probe failures


## Step 3: Describe Resources

Inspect unhealthy resources.

Check:

- container state
- restart count
- environment
- probes


## Step 4: Check Logs

Find application errors.


## Step 5: Check Deployment

Inspect:

- image
- env
- resources


## Step 6: Check Services

Inspect:

- selectors
- endpoints


## Step 7: Create RCA

Return:

ROOT CAUSE:

EVIDENCE:

CONFIDENCE:

PROPOSED PATCH:
