#!/bin/bash

COMMAND="$1"

FORBIDDEN_OPERATIONS=(
  "kubectl delete"
  "kubectl apply"
  "kubectl patch"
  "kubectl edit"
  "kubectl scale"
)

for OPERATION in "${FORBIDDEN_OPERATIONS[@]}"
do
  if [[ "$COMMAND" == *"$OPERATION"* ]]; then
    echo "BLOCKED: Kubernetes mutation operation is not allowed in RCA mode"
    exit 1
  fi
done

exit 0