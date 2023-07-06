## Ansible AWX-Operator

This repository contains an Ansible playbook to deploy and manage the AWX instance using the AWX-Operator on a Kubernetes cluster.

### Configuration Options

The following options can be set in the playbook:

- **k8s_awx_state:** State of the AWX instance, either "present" or "absent."
- **k8s_awx:** Configuration for the AWX instance, including:
  - Name and namespace.
  - Service and ingress configurations.
  - IPv6 support.
  - Ingress annotations.
  - Hostname.
  - TLS secret.
  - Admin user, email, and password secret.
  - Postgres configuration secret.
  - Resource requirements (CPU and memory requests).

- **k8s_awx_secrets:** Secrets for the AWX instance, including:
  - Postgres secrets (host, port, name, username, password, SSL).
  - Admin password secret.

### Secrets Configuration

The example secrets configuration includes:

- Postgres secrets with specified host, port, database name, username, password, and SSL preference.
- Admin password secret.

**Important:** Be sure to replace the provided secrets with your own secure values before deploying the AWX instance.

### Deployment

To deploy the AWX instance, run the Ansible playbook with the desired configuration options and secrets.

