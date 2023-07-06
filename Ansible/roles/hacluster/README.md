# Ansible Role: hacluster

This Ansible role installs and configures a high availability (HA) cluster on Debian-based systems using the Corosync and Pacemaker cluster stack, and the pcs tool for managing the cluster.

## Tasks

[main.yml](tasks/main.yml) imports [common.yml](tasks/common.yml) and [configure.yml](tasks/configure.yml).

[common.yml](tasks/common.yml) installs required packages, creates a folder for hacluster outputs, enables and starts the necessary services, and sets the hacluster password.

[configure.yml](tasks/configure.yml) sets up the cluster nodes and resources. It destroys any existing clusters, authenticates the cluster nodes, sets up the cluster, enables and starts the cluster, configures cluster properties, and creates a virtual IP resource.

## Variables

[main.yml](defaults/main.yml) contains the following variables:

- `hacluster_nodes`: List of cluster node hostnames or IPs
- `hacluster_passwd`: Password for the hacluster user
- `hacluster_virtual_ip`: Virtual IP address for the cluster
- `hacluster_configure`: Flag to determine if the cluster should be configured, default: 'no'
- `hacluster_outputs_folder`: Folder name for hacluster outputs
- `hacluster_outputs_dir`: Full path for hacluster outputs directory

## Handlers

[main.yml](handlers/main.yml) contains a single handler, `restart hacluster`, which stops and starts the cluster services.

## Usage

To use this role, include it in your playbook and define the required variables.

Example:

```yaml
- hosts: hacluster_nodes
  roles:
    - role: hacluster
      vars:
        hacluster_nodes:
            - node1.example.com
            - node2.example.com
        hacluster_passwd: mysecurepassword
        hacluster_virtual_ip: 192.168.1.100
        hacluster_configure: yes
```

---
This README.md provides an overview of the role, including its tasks, handlers, and variables. For more details, refer to the actual role files.
