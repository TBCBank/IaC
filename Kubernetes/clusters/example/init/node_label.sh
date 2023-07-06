#!/bin/bash

# Specify your label key and value here
label_key="node-role.kubernetes.io/data-plane"
label_value=""

# Get the list of worker nodes (excluding master nodes)
worker_nodes=$(kubectl get nodes --selector='!node-role.kubernetes.io/control-plane' -o jsonpath='{.items[*].metadata.name}')

# Iterate through the worker nodes and apply the label
for node in $worker_nodes; do
  echo "Applying label to node: $node"
  kubectl label node $node "${label_key}=${label_value}"
done

echo "All worker nodes have been labeled."
