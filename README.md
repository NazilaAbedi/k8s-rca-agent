# Kubernetes RCA Agent

A read-only Kubernetes Root Cause Analysis Agent powered by Claude Code and Kubernetes MCP.

## Overview

This agent investigates Kubernetes namespace failures by collecting evidence from the cluster and generating a Root Cause Analysis report.

The agent follows an evidence-first workflow and does not modify cluster resources.

## Architecture

```
User
  |
  | RCA Request
  v
Claude Code Agent
  |
  |-- CLAUDE.md
  |-- .claude/skills/k8s-rca/SKILL.md
  |-- MCP Configuration
  |
  v
Kubernetes MCP Server
  |
  v
Kubernetes Cluster
```

## Features

- Read-only Kubernetes investigation
- Evidence-based root cause analysis
- Kubernetes MCP integration
- Automated investigation workflow
- Safe remediation suggestions without applying changes

## Supported Investigation

The agent analyzes:

- Pods
- Events
- Deployments
- Services
- Endpoints
- Configurations
- Container logs
- Resource limits

## Safety

The agent operates in read-only mode.

**It can:**

- Get Kubernetes resources
- Describe resources
- Read container logs

**It cannot:**

- Apply changes
- Delete resources
- Patch resources
- Execute commands inside containers

## Project Structure

```
.
├── CLAUDE.md
├── .mcp.json
├── .claude
│   ├── settings.local.json
│   ├── skills
│   │   └── k8s-rca
│   │       └── SKILL.md
│   ├── rules
│   ├── hooks
│   └── prompts
└── README.md
```

## MCP Configuration

The agent connects to Kubernetes through an MCP server configured in:

```
.mcp.json
```

Example:

```json
{
  "mcpServers": {
    "kubernetes": {
      "type": "http",
      "url": "<MCP_SERVER_URL>"
    }
  }
}
```

## Usage

Start Claude Code:

```bash
claude
```

Run an RCA investigation:

```
Analyze namespace <namespace-name> using the Kubernetes RCA workflow.
```

The agent will:

1. Inspect resources
2. Collect evidence
3. Identify the root cause
4. Generate a structured RCA report

## Output Format

The final RCA report contains:

```
ROOT CAUSE:

EVIDENCE:

CONFIDENCE:

PROPOSED PATCH:
```

No remediation is automatically applied.