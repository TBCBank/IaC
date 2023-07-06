## Ansible Deployment for AWX Operator on Kubernetes

This repository contains Ansible inventory files, playbooks, roles, and GitLab CI configuration for deploying the AWX Operator on a Kubernetes cluster.

### Inventory

The inventory file defines the following connection:

- `kubeconfig`: Path to the kubeconfig file.
- `context`: Kubernetes context to use.

```yaml
connections:
  - kubeconfig: ~/.kube/config
    context: 'kubernetes-admin@kubernetes'
```

### Playbook

`main.k8s.yml:`

 - A playbook that runs the awx-operator role on localhost, using the K8S_AUTH_KUBECONFIG environment variable.

 ### Ansible

`requirements.yml:`

---
- src: git@gitlab.example.com:iac/ansible/roles/awx-operator.git
  scm: git
  version: main
  name: awx-operator


 ### GitLab CI Configuration

`gitlab-ci.yml:`

- This file includes the Kubernetes init template from the iac/gitlabcitemplates project and defines some variables.

```include:
  - project: 'iac/gitlabcitemplates'
    ref: main
    file: '/kubernetes/init_kubernetes.yml'

variables:
  MASTER_HOST: dev-k8s-master01.example.com
  K8S_CONFIG_FILE_PATH: /home/gitlab-runner/.kube/config
  STATE: k8s_awx_state
```
