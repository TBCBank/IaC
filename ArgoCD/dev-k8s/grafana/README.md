# grafana

This project deploys the grafana using ArgoCD and the grafana chart.

## Overview

This project contains the following files:

- `manifests/application.yaml`: ArgoCD application manifest for deploying the grafana chart.
- `manifests/project.yaml`: ArgoCD project manifest for managing the deployment.
- `values.yaml`: Configuration values for customizing the grafana deployment.
- `Chart.yaml`: Metadata and dependencies for the Helm chart.
- `.gitlab-ci.yml`: GitLab CI/CD pipeline configuration file for building and deploying the chart.

## Deployment

To deploy the grafana:

1. Configure the values in `values.yaml` according to your requirements.
2. Apply the ArgoCD application and project manifests in the `manifests` directory.
3. Follow the GitLab CI/CD pipeline defined in `.gitlab-ci.yml` for building and deploying the chart.

For more details, refer to the individual files and their comments in the project.

Feel free to customize the deployment based on your needs.
