<dir>
   <h1>GKE with Managed Prometheus and ArgoCD Setup using Terraform</h1>
</dir><dir>
    <p>This repository contains Terraform configurations to set up a GKE cluster with managed Prometheus and ArgoCD. ArgoCD monitors three applications in the Helm chart repository: Grafana, MongoDB, and Web Chatroom.</p>
</dir><dir>
    <h2>Repositories</h2>
</dir><dir>
    <ul>
        <li><a href="https://github.com/NVB20/chatroom-k8s-charts">chatroom-k8s-charts</a>: Helm charts for Grafana, MongoDB, and Web Chatroom.</li>
        <li><a href="https://github.com/NVB20/ChatClusterTF">ChatClusterTF</a>: Terraform configurations for GKE, managed Prometheus, and ArgoCD.</li>
        <li><a href="https://github.com/NVB20/web-chat-application">web-chat-application</a>: Source code for Web Chatroom.</li>
    </ul>
</dir><dir>
    <h2>Overview</h2>
</dir><dir>
    <p>This setup includes the following components:</p>
</dir><dir>
    <ul>
        <li><strong>GKE Cluster</strong>: Orchestrates containerized applications using Kubernetes.</li>
        <li><strong>Managed Prometheus</strong>: Provides monitoring and alerting capabilities for the cluster.</li>
        <li><strong>ArgoCD</strong>: Enables Continuous Delivery using GitOps workflows.</li>
    </ul>
</dir><dir>
  <div class="row">
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/terraform/terraform-original.svg" height="40" alt="terraform logo" />
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/prometheus/prometheus-original.svg" height="40" alt="prometheus logo" />
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/grafana/grafana-original.svg" height="40" alt="grafana logo" />
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/googlecloud/googlecloud-original.svg" height="40" alt="googlecloud logo" />
  </div></dir>