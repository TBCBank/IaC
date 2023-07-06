# Ansible Role: baselinux

This Ansible role is designed to configure a base Linux system for Debian and Red Hat-based distributions.Here's a brief overview of the tasks performed by this role:

1. [**main.yml**](tasks/main.yml): The main.yml file is the entry point for the role. Depending on the operating system family (Red Hat or Debian), it imports tasks from base.yml, base-rhel.yml, or base-debian.yml.
    - If the system is Red Hat-based, it imports tasks from base.yml and base-rhel.yml.
    - If the system is Debian-based, it imports tasks from base.yml and base-debian.yml.

2. [**base.yml**](tasks/base.yml): This file contains tasks common to both Red Hat and Debian-based systems, such as setting the hostname, timezone, environment variables, and configuring SSH client and server settings. It also sets the root password.

3. [**base-rhel.yml**](tasks/base-rhel.yml): This file contains tasks specific to Red Hat-based systems, such as modifying bashrc, managing SELinux, adding custom repositories, and installing common packages.

4. [**base-debian.yml**](tasks/base-debian.yml):  This file contains tasks specific to Debian-based systems, such as modifying bashrc, managing AppArmor, UFW (Uncomplicated Firewall), configuring locales, adding custom repositories, and installing common packages.

`block scheme`

```
+-------------------+
|     main.yml      |
+-------------------+
           |
           v
+------------------+          +-----------------+
|     base.yml     |------->  |  base-rhel.yml  |
+------------------+          +-----------------+
           |
           v
+------------------+
|  base-debian.yml |
+------------------+
```

---
**Variables**

The [`defaults/main.yml`](defaults/main.yml) file in the Ansible role contains a set of default variables used throughout the role. These variables include settings for the timezone, hostname, SSH, firewall, repositories, and packages to be installed on the target system.

Some key variables in this file are:

- `baselinux_delete_default_repos`: A boolean value to determine if default repositories should be removed.
- `root_password`: A vault-encrypted variable containing the hashed root password.
- `baselinux`: A dictionary containing various settings for timezone, hostname, firewall, proxy, repositories, and package installation specific to Red Hat and Debian-based systems.

The `baselinux` dictionary in the [`defaults/main.yml`](defaults/main.yml) file contains several variables used throughout the Ansible role for configuring various settings on the target system. Here is the full list of variables within the `baselinux` dictionary, along with their descriptions and example values:

1. `timezone`: The timezone to be set on the target system (e.g., "Asia/Tbilisi").

2. `hostname`: The hostname to be set on the target system (e.g., "{{ inventory_hostname }}").

3. `selinux`: A dictionary containing SELinux settings for Red Hat-based systems:
   - `mode`: The desired SELinux mode (e.g., "permissive").

4. `ufw`: A dictionary containing Uncomplicated Firewall (UFW) settings for Debian-based systems:
   - `mode`: The desired UFW mode (e.g., "disabled").

5. `sshd`: A dictionary containing SSH server settings:
   - `port`: The SSH port number (e.g., "22").
   - `logingracetime`: The SSH login grace time (e.g., "60m").
   - `permitrootlogin`: Allow or disallow root login (e.g., "yes").
   - `maxauthtries`: The maximum number of authentication attempts allowed (e.g., "6").
   - `pubkeyauthentication`: Allow or disallow public key authentication (e.g., "yes").
   - `passwordauthentication`: Allow or disallow password authentication (e.g., "yes").

6. `ssh`: A dictionary containing SSH client settings:
   - `stricthostkeychecking`: Enable or disable strict host key checking (e.g., "no").
   - `userknownhostsfile`: The file for storing known host keys (e.g., "/dev/null").

7. `proxy`: A dictionary containing proxy server settings:
   - `apt`:  A boolean value to determine if an APT proxy should be configured.
   - `server`: The proxy server address (e.g., "proxy.example.com").
   - `port`: The proxy server port number (e.g., "3128").
   - `protocol`: A dictionary containing protocol settings for HTTP and HTTPS (e.g., "http" and "https").

8. `repo`: A dictionary containing repository settings:
   - `server`: The repository server address (e.g., "repository.exmaple.com").
   - `default`: A list of default repository filenames to be excluded (e.g., ["example-&#42;.repo", "example-&#42;.list"]).
   - `rhel`: A list of custom repositories for Red Hat-based systems (e.g., ["rpm-rhel8-epel-remote"]).
   - `debian`: A list of custom repositories for Debian-based systems (e.g., ["debian-ubuntu-base-remote jammy-security multiverse", "debian-ubuntu-base-remote jammy universe", ...]).

9. `packages`: A dictionary containing package lists to be installed:
      - `common`: A list of common packages to be installed on both Red Hat and Debian-based systems (e.g., ["vim", "mc", "tree", "wget", "bash-completion", ...]).
      - `yum`: A list of packages to be installed on Red Hat-based systems (e.g., ["nfs-utils"]).
      - `apt`: A list of packages to be installed on Debian-based systems (e.g., ["nfs-common", "locales", "software-properties-common"]).

---
This README.md provides an overview of the role, including its tasks and variables. For more details, refer to the actual role files and templates.
