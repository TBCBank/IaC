## Ansible Default Values Readme

This readme provides an overview of the default values used in an Ansible playbook for managing ArgoCD configuration in a Kubernetes environment. These default values can be customized according to your specific requirements.

### ArgoCD State

- `k8s_argocd_state`: Specifies the desired state of the ArgoCD configuration. It can be set to either "present" or "absent". The "present" state ensures that the configuration is created or updated, while the "absent" state removes the configuration.

### LDAP Configuration in ArgoCD ConfigMap

- `k8s_argocd_admin`: Boolean value indicating whether the ArgoCD configuration includes LDAP integration for admin users (`true`) or not (`false`).
- `k8s_argocd_url`: The URL of the ArgoCD server, including the protocol (e.g., `https://argocd.ROOT`).

### Plugin Configuration in ArgoCD ConfigMap

- `k8s_argocd_plugins`: Configuration related to plugins in the ArgoCD ConfigMap.
  - `secret`: Secret-related plugin configuration.
    - `vault_addr`: The URL of the Vault server to be used by the plugin (e.g., `https://vault.ROOT`).
    - `vault_token`: The token for authentication with the Vault server.

### LDAP Configuration in ArgoCD

- `k8s_argocd_ldap`: LDAP configuration for ArgoCD integration.
  - `name`: The name of the LDAP server (e.g., `ldap.ROOT`).
  - `host`: The host and port of the LDAP server (e.g., `ldap.ROOT:389`).
  - `usersearch`: User search configuration within the LDAP server.
    - `basedn`: The base DN (Distinguished Name) for user search (e.g., `DC=example,DC=com`).
  - `groupsearch`: Group search configuration within the LDAP server.
    - `basedn`: The base DN (Distinguished Name) for group search (e.g., `DC=example,DC=com`).

### RBAC Configuration for ArgoCD

- `k8s_argocd`: RBAC (Role-Based Access Control) configuration for ArgoCD.
  - `namespace`: The Kubernetes namespace where ArgoCD is deployed (e.g., `argocd`).
  - `policy`: Policy configuration for ArgoCD.
    - `admins`: A list of admin team names that have administrative access to ArgoCD.
    - `readonlies`: A list of team names with read-only access to ArgoCD.
  - `ingress`: Ingress configuration for ArgoCD.
    - `spec`: Ingress specification for configuring the ArgoCD server's host and TLS settings.
      - `host`: The host to be used in the ArgoCD server's ingress configuration (e.g., `argocd.ROOT`).
      - `tls`: TLS configuration for securing the ArgoCD server.
        - `secret`: The name of the TLS secret to be used for TLS termination (e.g., `star-ROOT`).

These default values provide a starting point for configuring ArgoCD using Ansible. You can modify these values in your playbook or provide different values as needed.