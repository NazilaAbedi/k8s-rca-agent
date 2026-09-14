# Kubernetes RCA Skill


## Purpose

This skill defines the investigation workflow
for Kubernetes Root Cause Analysis.


## Investigation Workflow


### Step 1: Inspect Pods

Start by checking pod status.

Look for:

- CrashLoopBackOff
- ImagePullBackOff
- Pending
- OOMKilled
- Failed containers


Goal:

Identify unhealthy workloads.


---


### Step 2: Inspect Kubernetes Events

Check namespace events.

Look for:

- scheduling failures
- image pull errors
- failed mounts
- probe failures
- resource issues


Goal:

Find Kubernetes-level evidence.


---


### Step 3: Describe Resources

Describe unhealthy resources.

Inspect:

- container states
- environment variables
- restart count
- probes
- resource limits


Goal:

Understand why the workload failed.


---


### Step 4: Inspect Previous Logs

Check previous container logs.

Look for:

- application crashes
- configuration errors
- dependency failures


Goal:

Find application-level evidence.


---


### Step 5: Inspect Deployment Configuration

Review:

- container image
- environment configuration
- probes
- resources


Goal:

Find configuration problems.


---


### Step 6: Inspect Services and Endpoints

Check:

- service selectors
- endpoint availability
- connectivity issues


Goal:

Detect networking problems.


---


### Step 7: Analyze Metrics

Use metrics when required.

Check:

- CPU usage
- Memory usage
- Error rate
- Latency


Goal:

Correlate failures with resource behavior.


---


### Step 8: Generate Root Cause

Create a conclusion only after evidence collection.


Output:

ROOT CAUSE:

EVIDENCE:

CONFIDENCE:

PROPOSED PATCH:


Never apply the proposed patch.
