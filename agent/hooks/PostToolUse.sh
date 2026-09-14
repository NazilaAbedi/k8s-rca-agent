#!/bin/bash

OUTPUT="$1"

echo "$OUTPUT" | \
sed -E \
's/(password|PASSWORD|token|TOKEN|secret|SECRET)=([^ ]+)/\1=REDACTED/g'