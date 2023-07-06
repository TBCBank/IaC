# Ansible Role: nginx

This Ansible role installs and configures Nginx on Debian-based systems. It provides support for SSL, custom server configurations, HTTP and stream upstreams, and various other configuration options.

## Requirements

- A Debian-based system
- Ansible 2.9 or higher


## Tasks

### [main.yml](tasks/main.yml)

- Imports the following task files based on the system's OS family:
  - `install.yml`
  - `configure.yml`
  - `service.yml`

### [install.yml](tasks/install.yml)

- Copies the Nginx GPG key
- Adds the Nginx GPG key to the system's keyring
- Adds the Nginx repository
- Installs Nginx with the specified version
- Holds the Nginx package at the installed version
- Installs Nginx dynamic modules if specified

### [configure.yml](tasks/configure.yml)

- Creates the `nginx.service.d` directory if it doesn't exist
- Modifies limits for Nginx
- Modifies logrotate configuration for Nginx
- Creates a directory for SSL files
- Copies SSL files to the SSL directory
- Finds Nginx configuration files
- Cleans Nginx configuration files
- Deletes `sites-available` and `sites-enabled` folders
- Modifies the Nginx main configuration file
- Modifies Nginx HTTP server configurations
- Modifies Nginx stream server configurations
- Modifies Nginx HTTP upstream configurations
- Modifies Nginx stream upstream configurations

### [service.yml](tasks/service.yml)

- Performs a systemd daemon reload
- Starts and enables the Nginx service

## Handlers

### [main.yml](handlers/main.yml)

- Performs a systemd daemon reload
- Tests Nginx configuration
- Reloads Nginx
- Restarts Nginx

## Templates

- [`nginx.conf.j2`](templates/nginx.conf.j2): The main Nginx configuration file template
- [`http_server.conf.j2`](templates/http_server.conf.j2): The HTTP server configuration file template
- [`stream_server.conf.j2`](templates/stream_server.conf.j2): The stream server configuration file template
- [`http_upstreams.j2`](templates/http_upstreams.j2): The HTTP upstream configuration file template
- [`stream_upstreams.j2`](templates/stream_upstreams.j2): The stream upstream configuration file template


## Role Variables 

Refer to the [`defaults/main.yml`](defaults/main.yml) file for the detailed structure of the `nginx_config` variable and its subvariables. This includes settings for HTTP and Stream servers and locations, along with their respective settings like listen, server_name, rewrites, returns, custom settings, root, index, SSL, headers, and proxy settings.


- `nginx_modules`
    - A list of Nginx modules to install.
- `nginx_repo`
    - Nginx repository used for the installation.
- `nginx_keyring`
    - Name of the keyring file for the Nginx repository.
- `nginx_keyring_path`
    - Path to the keyring file.
- `nginx_version`
    - Version of Nginx to be installed.
- `nginx_stream_log_enabled`
    - Boolean to enable or disable stream log.
- `nginx_http_enabled`
    - Boolean to enable or disable the HTTP section in Nginx configuration.
- `nginx_stream_enabled`
    - Boolean to enable or disable the Stream section in Nginx configuration.
- `nginx_ssl_dir`
    - Directory path for SSL certificates and keys.
- `nginx_config`
    - A dictionary containing the main Nginx configuration settings, such as user, worker processes, PID, worker connections, and HTTP and Stream settings.
    - `nginx_config.http`
        - A dictionary containing the HTTP section configuration settings, such as keepalive timeout, gzip, upstreams, and server settings.
    - `nginx_config.stream`
        - A dictionary containing the Stream section configuration settings, such as upstreams and server settings.


---
This README.md provides an overview of the role, including its tasks and variables. For more details, refer to the actual role files and templates.
