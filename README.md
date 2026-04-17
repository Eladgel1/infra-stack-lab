# 🚀 Infra Stack Lab

A hands-on project focused on practicing **DevOps fundamentals** and **infrastructure workflows**.

This repository it’s about building, running, and managing services in a clean and reproducible way.

---

## 🧠 Purpose

This project was created to:

- Practice working with **Docker & containerized services**
- Simulate a **multi-service environment**
- Improve understanding of **infrastructure setup**
- Build real-world **DevOps habits and workflows**

---

## 🛠️ Tech Stack

- Docker
- Docker Compose
- Node.js (basic service)
- PostgreSQL (or relevant DB if used)

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
└── k8s/              # Kubernetes manifests
```

---

## ⚙️ Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/Eladgel1/infra-stack-lab.git
cd infra-stack-lab
```

### 2. Run the stack

```bash
docker compose up --build
```

### 3. Stop the stack

```bash
docker compose down
```

---

## 🎯 Key Concepts Practiced

- Containerization
- Service orchestration
- Environment configuration
- Local infrastructure simulation

---

## 📌 Notes

- Focus is on **DevOps processes**, not business logic
- Can be extended with CI/CD, monitoring, or cloud deployment

---

## 📬 Contact

If you're interested in collaborating or sharing ideas, feel free to reach out 🚀
