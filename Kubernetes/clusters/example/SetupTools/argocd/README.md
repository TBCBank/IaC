## Ansible Deployment for Argo CD on Kubernetes Cluster

This repository contains an Ansible inventory file, playbook, role, and GitLab CI configuration for deploying and managing Argo CD on a Kubernetes cluster.

### Inventory

The inventory file specifies the following connections:

- `kubeconfig`: Path to the kubeconfig file, `~/.kube/config`.
- `context`: The context to use, `'kubernetes-admin@kubernetes'`.

### Playbook

The playbook runs on `localhost` and includes the `argocd` role. It uses the `K8S_AUTH_KUBECONFIG` environment variable to provide the kubeconfig file path:

```yaml
- hosts: localhost
  roles:
    - argocd
  environment:
    K8S_AUTH_KUBECONFIG: ~/.kube/config
