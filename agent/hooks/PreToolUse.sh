#!/bin/bash

COMMAND="$1"

FORBIDDEN_COMMANDS=(
"delete"
"apply"
"patch"
"edit"
"scale"
)

for CMD in "${FORBIDDEN_COMMANDS[@]}"
do
    if [[ "$COMMAND" == *"$CMD"* ]]; then
        echo "BLOCKED: unsafe Kubernetes operation detected"
        exit 1
    fi
done

exit 0