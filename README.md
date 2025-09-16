# MyWebApp – GitHub → CodeDeploy → EC2 (with SNS + CloudWatch)

[![Deploy](https://github.com/khqayyum/mywebapp/actions/workflows/deploy.yml/badge.svg)](./.github/workflows/deploy.yml)

A lean CI/CD pipeline that **auto-deploys** a static web page to **Amazon EC2** on every push to `main`.  
It also sends **SNS email notifications** for deployment status and streams **Nginx + CodeDeploy logs** to **CloudWatch**.

---

## 🧱 Architecture

```mermaid
flowchart LR
  A[Developer (''Git push'')] -->|push main| B[GitHub Repo]
  B -->|GitHub Actions| C[Zip artifact]
  C -->|AWS CLI| D[CodeDeploy: CreateDeployment]
  D -->|Lifecycle hooks| E[EC2 (Nginx)]
  E -->|Logs| F[CloudWatch Logs]
  D -->|Status events| G[SNS Email]

  subgraph EC2 Instance
    E1[Nginx /usr/share/nginx/html]
    E2[CodeDeploy Agent]
  end
```
