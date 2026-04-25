# 🚀 Infra Stack Lab

A hands-on project focused on practicing **DevOps fundamentals**, **containerization**, and **Kubernetes-based orchestration**.

This repository demonstrates how to build, run, and manage services using both **Docker Compose** and **Kubernetes (Minikube)** in a clean, reproducible, and production-inspired workflow.

---

## 🧠 Purpose

This project was created to:

- Practice working with **Docker & containerized services**
- Simulate a **multi-service environment**
- Learn **Kubernetes fundamentals (Deployment, Service, Ingress, HPA)**
- Build real-world **DevOps habits and workflows**

---

## 🛠️ Tech Stack

- Docker
- Docker Compose
- Kubernetes (Minikube)
- Node.js (Express API)
- PostgreSQL

---

## 📦 Project Structure

```
infra-stack-lab
├── drizzle/          # Database migrations & metadata (Drizzle ORM)
├── logs/             # Application logs (combined, error)
├── scripts/          # Dev & production helper scripts
├── src/              # Main application source code
│   ├── config/       # App configuration (DB, logger, Arcjet)
│   ├── controllers/  # Request handlers (auth, users)
│   ├── middleware/   # Express middlewares (auth, security)
│   ├── models/       # Data models
│   ├── routes/       # API route definitions
│   ├── services/     # Business logic layer
│   ├── utils/        # Helper utilities
│   └── validations/  # Request validation schemas
├── tests/            # Integration & unit tests
└── k8s/              # Kubernetes manifests & documentation
```

---

## 🏗️ Architecture Overview

```mermaid
%%{init: {'theme':'neutral'}}%%
flowchart LR

%% ---------- Source Control ----------
subgraph Source["Source Control"]
    GitHub["GitHub Repository"]
end

%% ---------- CI/CD ----------
subgraph CICD["CI/CD Pipeline"]
    LintFormat["Lint + Prettier"]
    Tests["Automated Tests"]
    ImageBuild["Build Docker Image"]
end

%% ---------- Registry ----------
subgraph Registry["Container Registry"]
    DockerHub["Docker Hub"]
end

%% ---------- Local Docker Workflow ----------
subgraph LocalDocker["Local Docker Workflow"]
    Dockerfile["Dockerfile"]
    Compose["Docker Compose"]
    LocalContainers["Local Containers"]
end

%% ---------- Kubernetes ----------
subgraph K8s["Kubernetes (Minikube)"]
    Scripts["K8s Scripts<br/>setup / redeploy / status"]
    Minikube["Minikube Cluster"]
    Deployment["Deployment"]
    Service["Service<br/>ClusterIP"]
    Ingress["Ingress<br/>infra-stack-lab.local"]
    HPA["HPA<br/>2-5 replicas"]
    Config["ConfigMap + Secret"]
    Pods["API Pods<br/>Node.js + Express"]
end

%% ---------- External Services ----------
subgraph External["External Services"]
    Database[(External Database)]
end

%% ---------- Source to CI/CD ----------
GitHub --> LintFormat
GitHub --> Tests
GitHub --> ImageBuild
ImageBuild --> DockerHub

%% ---------- Local Docker Flow ----------
GitHub --> Dockerfile
Dockerfile --> Compose
Compose --> LocalContainers

%% ---------- Kubernetes Flow ----------
GitHub --> Scripts
Scripts --> Minikube
Scripts --> Deployment
Scripts --> Config
Deployment --> Pods
Config --> Pods
Service --> Pods
Ingress --> Service
HPA -.->|"scales"| Deployment
Pods --> Database

%% ---------- Image Usage ----------
Dockerfile --> ImageBuild
DockerHub -.->|"published image"| Minikube
```

---

## ⚙️ Getting Started

### Clone the repo

```bash
git clone https://github.com/Eladgel1/infra-stack-lab.git
cd infra-stack-lab
```

## 🐳 Running with Docker Compose

### Run the stack

```bash
docker compose up --build
```

### Stop the stack

```bash
docker compose down
```

---

## ☸️ Running with Kubernetes (Minikube)

### Prerequisites

- Docker Desktop
- Minikube
- kubectl

### 1. Start Minikube

```bash
minikube start
```

### 2. Enable required addons

```bash
minikube addons enable ingress
minikube addons enable metrics-server
```

### 3. Deploy the application

```bash
npm run k8s:up
```

### 4. ⚠️ Important (Windows + Docker driver)

If you are using **Windows with Docker Desktop**, you must run:

```bash
minikube tunnel
```

in a separate terminal.

Also ensure your `hosts` file includes:

```
127.0.0.1 infra-stack-lab.local
```

### 5. Access the application

```
http://infra-stack-lab.local
```

---

## 📄 Kubernetes Resources

- Deployment (application pods)
- Service (ClusterIP)
- Ingress (domain routing)
- HPA (Horizontal Pod Autoscaler)
- ConfigMap & Secret

See full documentation in:

```
k8s/README.md
```

---

## 🎯 Key Concepts Practiced

- Containerization
- Kubernetes orchestration
- Ingress routing
- Autoscaling (HPA)
- Local infrastructure simulation
- DevOps workflows & automation

---

## 📬 Contact

If you're interested in collaborating or sharing ideas, feel free to reach out 🚀
