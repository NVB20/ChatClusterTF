# ChatOps
Ops Repo for my devops project

terraform:
- deploy GCP cloud k8s vpc
- save tfstate in bucket
- deploy helm in vpc
- deploy argoCD
- deploy prometheus and grafana

Repo(app)--ci-->update helm chart image--ci-->Repo(helm) --cd--> update terraform deploy--cd--> Repo(ops)