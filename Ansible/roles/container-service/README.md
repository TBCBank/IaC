## Role: container-service

This Ansible role is responsible for installing and configuring container runtime services like Docker and containerd on Debian-based systems. It handles adding the appropriate repository, installing the desired container service, holding package versions, and configuring proxy settings if required.

### Tasks

The tasks in [tasks/main.yml](tasks/main.yml) perform the following actions:

1. Add the Docker GPG key to the keyring.
2. Add the container repository.
3. Install Docker if the `container_service` variable is set to `"docker"`.
4. Install containerd if the `container_service` variable is set to `"containerd"`.
5. Hold the package versions for containerd.io, docker-ce, and docker-ce-cli.
6. Create the Docker systemd service directory if the `container_service` variable is set to `"docker"`.
7. Configure the Docker proxy if `container_service_proxy_enabled` is set to `true` and `container_service` is set to `"docker"`.
8. Restart the Docker service if necessary.
9. Create the containerd systemd service directory if the `container_service` variable is set to `"containerd"`.
10. Configure the containerd proxy if `container_service_proxy_enabled` is set to `true` and `container_service` is set to `"containerd"`.
11. Restart the containerd service if necessary.

### Handlers

The handlers in [handlers/main.yml](handlers/main.yml) perform the following actions:

- Restart the containerd service and reload the systemd daemon.

### Variables

The role uses the following variables, defined in [defaults/main.yml](defaults/main.yml). You can override these variables in your playbook as needed.

- `container_service` (default: `containerd`): The container runtime service to install and configure (options: `"docker"` or `"containerd"`).
- `container_service_repo`, `container_service_gpg`, and `container_service_gpg_path`: Variables for the container repository and GPG keyring.
- `container_service_containerd` and `container_service_containerd_version`: Variables for the containerd package and version.
- `container_service_docker` and `container_service_docker_version`: Variables for the Docker packages and version.
- `container_service_proxy_enabled` (default: `false`): Set to `true` to enable proxy configuration for the container runtime service.
- `container_service_http_proxy`, `container_service_https_proxy`, and `container_service_no_proxy`: Variables for the proxy settings.

### Usage

To use this role in your playbook, add it to the `roles` section and set the appropriate variables, such as the `container_service` and `container_service_proxy_enabled`. Here's an example:

```yaml
- hosts: all
  become: yes
  roles:
    - role: container-service
      vars:
        container_service: docker
        container_service_proxy_enabled: true
```

---
This README.md provides an overview of the role, including its tasks and variables. For more details, refer to the actual role files and templates.