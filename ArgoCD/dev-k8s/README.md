# Initialize: Change Inspire ArgoCD Password

This readme provides step-by-step instructions for changing the Inspire ArgoCD password and kubeconfig in the CI/CD settings. Please follow the instructions below to complete the process.

## Prerequisites

- You should have access to the Kubernetes cluster where ArgoCD is deployed.
- You should have the necessary permissions to modify secrets and variables in the CI/CD settings.

## Step 1: Obtain the Current ArgoCD Password

1. Open your terminal or command prompt.
2. Run the following command to retrieve the current ArgoCD password:

   ```bash
   ssh dev-k8s-master01.example.com
   ```

   ```bash
   DEV_K8S_ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
   ```

   ```bash
   echo $DEV_K8S_ARGOCD_PASSWORD
   ```

## Step 2: Update the ArgoCD Password in CI/CD Settings

1. Open the Inspire Iac application.
2. Navigate to `Iac > DevK8s > CI/CD Settings > Variables`.
3. Find the variable named `DEV_K8S_ARGOCD_PASSWORD`.
4. Update the value of `DEV_K8S_ARGOCD_PASSWORD` with the new ArgoCD password.

That's it! You have successfully changed the Inspire ArgoCD password and updated the kubeconfig in the CI/CD settings.
