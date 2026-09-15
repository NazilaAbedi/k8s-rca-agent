# Kubernetes RCA Request


## Target Namespace

{{NAMESPACE}}


## Task

Investigate the Kubernetes namespace above.

Find the root cause of the failure and propose a safe remediation.

if we have more than one mistake in hour pods you must show and handle all of them , i meanyou should find mistaken pods all over cluster.


## Investigation Rules

- Collect evidence before making conclusions.
- Use Kubernetes investigation tools.
- Do not modify cluster resources.
- Do not expose sensitive information.
- Follow the RCA workflow defined in the skill.


## Final Answer Format

IMPORTANT:
Your final answer MUST contain ONLY the following four sections.

Do not add any introduction, summary, tables, explanations, prevention advice, or additional sections.


ROOT CAUSE:
Write exactly ONE sentence describing the most likely root cause.


EVIDENCE:
List only evidence items in this format:

- <tool name> -> <observation>


CONFIDENCE:
Write exactly one value:

high

or

medium

or

low


PROPOSED PATCH:
Provide ONLY a YAML remediation example.

Do not include:
- kubectl commands
- operator instructions
- explanations
- prevention recommendations


## Example Output

ROOT CAUSE:
The pod is failing because the configured container image does not exist.

EVIDENCE:
- kubectl_get pods -> pod status is ImagePullBackOff.
- kubectl_describe pod -> container image reference is invalid.
- kubectl_get events -> image pull failed because the image was not found.

CONFIDENCE:
high

PROPOSED PATCH:
apiVersion: v1
kind: Pod
metadata:
  name: example
spec:
  containers:
    - name: app
      image: valid-image:tag