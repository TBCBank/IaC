## Ansible Role for NGINX Ingress Controller

This role deploys the NGINX Ingress Controller on a Kubernetes cluster using Helm.

### Default Variables

`defaults/main.yml`:

```yaml
---
## options "present" or "absent"
k8s_nginx_state: present

k8s_nginx:
  namespace: nginx-ingress
  image:
    tag: 3.1.0
  kind: daemonset
  resources:
    requests:
      cpu: 100m
      memory: 128Mi
    limits:
      cpu: 1
      memory: 1Gi
  service:
    type: LoadBalancer
```
