# Borealis Project: Advanced Cloud-Native Deployment

## Overview

This project showcases an advanced deployment architecture using Terraform for infrastructure as code, Kubernetes for orchestration, Argo CD for continuous deployment, and GitHub Actions for CI/CD pipelines. It features the creation of a VPC with both public and private subnets, an EKS cluster setup, and dual load balancers managed through Kubernetes Ingress Controllers and Ingress Resources, highlighting modern cloud-native deployment strategies with AWS.

## Components and Detailed Configuration

### Terraform Infrastructure Setup

- **VPC Configuration**: Setup includes public and private subnets for segregation and security of resources.
- **EKS Cluster**: Configuration for Kubernetes cluster creation in AWS, optimized for scalability and performance.
- **NAT Gateway**: Ensures secure internet access for services in the private subnet.
- **IAM Roles and Policies**: Custom roles and policies from `iam_policy.json` for granular access control within AWS services.

### Kubernetes Configuration

- **Service Accounts**: Creation and mapping of Kubernetes service accounts to IAM roles for seamless integration and secure access between services.
- **AWS Load Balancer Controller**: Deployment using Helm to manage ingress traffic efficiently, ensuring high availability and scalability.

### Argo CD with Helm

- **Argo CD Setup**: Utilizes a Helm chart for Argo CD setup, emphasizing custom values for personalized deployment strategies.
- **ApplicationSet Resource**: Monitors the kuard application for changes, facilitating automated deployments through Argo CD.

### Application Deployment

- **Kuard Application**: Demonstrates a simple, scalable application deployment using Kubernetes manifests for deployment, service, and ingress resources.
- **Ingress Configuration**: Utilizes two types of load balancers via Ingress Controllers and Ingress Resources to demonstrate advanced traffic management and routing capabilities.

## Security and CI/CD

- **HTTPS Configuration**: Ensures secure communication using self-signed certificates managed through ACM for both Argo CD access between Load Balancer and Argo CD because of gRPC and also between client and Load Balancer for demonstration purposes.
- **GitHub Actions**: Automates CI/CD pipelines, integrating with Terraform for demonstration purposes.

## Deployment Process

The deployment is streamlined through Terraform commands (`terraform init`, `validate`, `plan`, and `apply`), automating the creation of necessary infrastructure components like VPC, EKS cluster, NAT gateways, IAM roles and policies, and the setup for IAM roles for service accounts (IRSA). Notably, the AWS Load Balancer Controller is installed via Terraform, negating the need for manual Helm commands for this component. After infrastructure setup, the next steps involve manually importing and creating certificates for HTTPS, deploying Argo CD with Helm, and applying the Argo CD ApplicationSet for application management. This process ensures that all components, including networking, security, and Kubernetes resources, are correctly configured and integrated.

Finally, to facilitate certain aspects of the deployment, refer to the included `commands` file. This file contains essential commands for integrating the AWS environment with your local setup (such as updating the kubeconfig for EKS), managing the Argo CD deployment via Helm (including repository addition, installation, updates, and uninstallation), forwarding ports for local access to the Argo CD server, and generating SSL certificates for secure HTTPS communication. These commands are instrumental in setting up Argo CD, handling certificates with ACM, and other things.

## Security

- **IAM Policies**: Ensure least privilege access through custom IAM policies.
- **HTTPS and ACM**: Utilize ACM for managing certificates, enforcing HTTPS for secure communication.
- **Network Isolation**: Discuss the use of public and private subnets for resource isolation.

# Monitoring and Logging

For monitoring and logging, we utilize CloudWatch metrics to monitor and CloudWatch logs to log the whole cluster. This setup aids in troubleshooting and ensuring the cluster's optimal performance.

# Contributing

We welcome contributions from the community! If you'd like to contribute to the project, please refer to our [Contribution Guidelines](CONTRIBUTING.md) for more information on how to get started.

# License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

# Support

For questions or support, please open an issue in the GitHub issue tracker. You can also contact us directly via email at [your-email@example.com](mailto:your-email@example.com).
