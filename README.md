# MyWebApp – GitHub → CodeDeploy → EC2 (with SNS + CloudWatch)

[![Deploy](https://github.com/khqayyum/mywebapp/actions/workflows/deploy.yml/badge.svg)](./.github/workflows/deploy.yml)

A lean CI/CD pipeline that **auto-deploys** a static web page to **Amazon EC2** on every push to `main`.  
It also sends **SNS email notifications** for deployment status and streams **Nginx + CodeDeploy logs** to **CloudWatch**.

---

## 🧱 Architecture
```mermaid
graph LR
  A[Developer pushes code to GitHub] --> B[GitHub Actions Workflow]
  B -->|Zips code & uploads| C[S3 Bucket]
  C --> D[AWS CodeDeploy]
  D --> E[EC2 Instance (Nginx Web Server)]
  D --> F[SNS Notifications - Deployment Status]
  G[CloudWatch Agent] --> H[CloudWatch Metrics & Alarms]
  H -->|Trigger alert| F
```

