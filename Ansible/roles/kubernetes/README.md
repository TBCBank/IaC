# Kubernetes Ansible Role

This Ansible role installs and configures a Kubernetes cluster on Debian-based systems. It supports configuring master and worker nodes, as well as different network providers.

## Role Tasks

The tasks in this role are organized into multiple YAML files, which are imported in [tasks/main.yml](tasks/main.yml).

### [tasks/main.yml](tasks/main.yml)

This file imports the following task files based on the role variables:

- `common.yml` for all nodes
- `init.yml` for initializing a new Kubernetes cluster
- `master.yml` for master nodes
- `worker.yml` for worker nodes

### [tasks/common.yml](tasks/common.yml)

This file contains tasks that are common to all nodes in the cluster, including:

- Creating a folder for Kubernetes outputs
- Disabling swappiness
- Configuring fstab
- Enabling necessary kernel modules
- Configuring sysctl settings
- Setting up containerd
- Adding the Kubernetes GPG key and repository
- Installing and holding kubelet, kubeadm, and kubectl
- Restarting and enabling kubelet

### [tasks/init.yml](tasks/init.yml)

This file contains tasks for initializing a new Kubernetes cluster, including:

- Creating the init config
- Pulling Kubernetes images
- Initializing the Kubernetes cluster
- Creating the kubeconfig directory and copying the admin.conf file
- Installing the selected Kubernetes network provider (Calico or Cilium)

### [tasks/master.yml](tasks/master.yml)

This file contains tasks for master nodes, including:

- Pulling Kubernetes images
- Uploading certificates/renewing certificate keys (for init nodes)
- Joining the cluster as a master node
- Creating the kubeconfig directory and copying the admin.conf file

### [tasks/worker.yml](tasks/worker.yml)

This file contains tasks for worker nodes, including:

- Joining the cluster as a worker node

## Handlers

The role contains handlers in [handlers/main.yml](handlers/main.yml) for:

- Upgrading the cluster
- Upgrading nodes
- Restarting kubelet


## Role Variables

The following variables are available for configuration:

| Variable | Description | Default |
|----------|-------------|---------|
| `kubernetes_repo` | Kubernetes repository for Debian-based systems | "debian-ubuntu-kubernetes-remote" |
| `kubernetes_keyring` | Kubernetes keyring filename | "kubernetes-archive-keyring.gpg" |
| `kubernetes_keyring_path` | Path to the Kubernetes keyring file | "/etc/apt/keyrings/{{ kubernetes_keyring }}" |
| `kubernetes_outputs_folder` | Folder name for Kubernetes outputs | "k8s_outputs" |
| `kubernetes_outputs_dir` | Directory for Kubernetes outputs | "{{ ansible_env.HOME }}/{{ kubernetes_outputs_folder }}" |
| `kubernetes_init` | Flag to specify if the node is the initial master | false |
| `kubernetes_master` | Flag to specify if the node is a master node | false |
| `kubernetes_worker` | Flag to specify if the node is a worker node | false |
| `kubernetes_upgrade` | Flag to specify if the node should be upgraded | false |
| `kubernetes_network_provider` | Kubernetes network provider, e.g. "calico" or "cilium" | "cilium" |
| `kubernetes_cilium_init` | Flag to specify if Cilium should be initialized | false |
| `kubernetes_master_nodes` | List of Kubernetes master nodes | [] |
| `kubernetes_worker_nodes` | List of Kubernetes worker nodes | [] |
| `kubernetes_node` | Hostname of the Kubernetes node | "{{ inventory_hostname }}" |
| `kubernetes_version` | Kubernetes version | "1.25.3" |
| `kubernetes_kubelet_version` | Kubelet version | "{{ kubernetes_version }}-00" |
| `kubernetes_kubeadm_version` | Kubeadm version | "{{ kubernetes_version }}-00" |
| `kubernetes_kubectl_version` | Kubectl version | "{{ kubernetes_version }}-00" |
| `kubernetes_pod_network_cidr` | Kubernetes pod network CIDR | "10.244.0.0/24" |
| `kubernetes_service_network_cidr` | Kubernetes service network CIDR | "10.96.0.0/16" |
| `kubernetes_apiserver_advertise_address` | Kubernetes API server advertise address | "{{ ansible_default_ipv4.address }}" |
| `kubernetes_apiserver_advertise_port` | Kubernetes API server advertise port | 6443 |
| `kubernetes_cri_socket` | Kubernetes CRI socket | "unix:///var/run/containerd/containerd.sock" |
| `kubernetes_control_endpoint_address` | API server load balancer address | "dev-k8s.example.com" |
| `kubernetes_control_endpoint_port` | API server load balancer port | 6443 |
| `kubernetes_token` | Kubernetes join token | "czh2jx.w18bxqpdnjyxm2tm" |
| `kubernetes_certificate_key` | Kubernetes certificate key | "40f5c608d403f6a1f6f1b2f63ff5b5237b07b875426ec74d8e7d66c2a454662d" |
| `kubernetes_cluster_name` | Kubernetes cluster name | "kubernetes" |
| `kubernetes_dns_domain` | Kubernetes DNS domain | "cluster.local" |


---
This README.md provides an overview of the role, including its tasks, handlers and variables. For more details, refer to the actual role files and templates.
