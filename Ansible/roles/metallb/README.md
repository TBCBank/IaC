# Ansible Variables

The following variables can be used to configure MetalLB in Kubernetes using Ansible:

## MetalLB

- `k8s_metallb_ip_pool_name: first-pool` specifies the name of the IP address pool in MetalLB.
- `k8s_metallb_ip_pool: 10.20.30.40-10.20.30.45` specifies the range of IP addresses to use for the MetalLB pool.
- `k8s_metallb_ip_pool_advertisement: l2advertisement` specifies the type of advertisement to use for the MetalLB pool.
- `k8s_metallb_namespace: metallb-system` specifies namespace for MetalLB

# Ansible Roles for Installing MetalLB in Kubernetes

This Ansible playbook contains roles for installing MetalLB in Kubernetes.

## Create a MetalLB Namespace

The following task creates a MetalLB namespace in Kubernetes:

```
- name: create metallb namespace
  k8s:
    api_version: v1
    kind: Namespace
    name: "{{ k8s_metallb_namespace }}"
    state: present
  tags:
    - metallb
```


## Install MetalLB System

The following task installs the MetalLB system in the specified namespace:

```
- name: install metallb using helm
  kubernetes.core.helm:
    release_name: metallb
    chart_ref: metallb/metallb
    namespace: "{{ k8s_metallb_namespace }}"
    kubeconfig: ~/.kube/config
    wait: true
  tags:
    - metallb
```


## Apply MetalLB IP Address Pool

The following task applies the MetalLB IP address pool configuration to the cluster:

```
- name: create metallb ipaddress pool
  kubernetes.core.k8s:
    state: present
    template:
      - path: 'ipaddresspool.yml.j2'
  tags:
    - metallb
```

Note that the `ipaddresspool.yml.j2` file contains the configuration for the IP address pool, including the variables specified above. You can modify this file to match your network configuration.

---