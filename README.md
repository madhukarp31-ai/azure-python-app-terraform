# 🚀 Azure Python Web App Deployment with Docker & Terraform

## 📌 Project Overview

This project demonstrates deploying a custom Python web application to **Azure App Service (Linux)** using **Docker and Terraform**.

It showcases end-to-end cloud deployment using Infrastructure-as-Code (IaC), containerization, and Azure PaaS services.

---

## 🏗️ Architecture

```
User → Azure App Service → Docker Container → Python App
                         ↓
                  Azure Container Registry
                         ↓
                    Terraform (IaC)
```

---

## ⚙️ Tech Stack

* **Cloud:** Microsoft Azure
* **IaC:** Terraform
* **Containerization:** Docker
* **Language:** Python
* **Hosting:** Azure App Service
* **Registry:** Azure Container Registry (ACR)

---

## 📂 Project Structure

```
.
├── app.py
├── Dockerfile
├── requirements.txt
├── Terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.auto.tfvars
│   └── Docker_push.sh
└── README.md
```

---

## 🚀 Deployment Steps

### 1. Run App Locally

```bash
python app.py
```

### 2. Build Docker Image

```bash
docker build -t myapp .
```

### 3. Run Container

```bash
docker run -p 80:80 myapp
```

### 4. Deploy Infrastructure

```bash
terraform init
terraform plan
terraform apply
```

---

## ☁️ Azure Resources Created

* Resource Group
* Azure Container Registry (ACR)
* App Service Plan
* Azure App Service

---

## 📈 Autoscaling Note

Autoscaling is not enabled due to the Basic (B1) plan limitation.

To enable:

* Upgrade to Standard (S1) plan
* Configure autoscale via Azure Monitor or Terraform

---

## ✅ Key Learnings

* Infrastructure provisioning using Terraform
* Containerizing applications with Docker
* Deploying apps to Azure App Service
* Understanding cloud scalability limitations

---

## 🚀 Future Improvements

* Add CI/CD pipeline (GitHub Actions)
* Enable autoscaling
* Integrate monitoring (Azure Monitor / App Insights)
* Use Managed Identity for security

---


