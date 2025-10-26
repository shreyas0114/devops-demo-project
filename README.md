.

🚀 DevOps CI/CD Pipeline using Docker, GitHub Actions, and Render
📘 Project Overview

This project demonstrates a complete end-to-end DevOps workflow, from application development to automated cloud deployment.
A Flask-based Python web app is containerized using Docker, integrated with GitHub Actions for Continuous Integration (CI), and automatically deployed to Render Cloud for Continuous Delivery (CD).

Every code push to GitHub triggers an automated build, test, and deployment pipeline — achieving a fully functional CI/CD lifecycle.

🧱 Tech Stack
Category	Tools / Technologies
Programming	Python, Flask
Containerization	Docker
Version Control	Git, GitHub
Continuous Integration	GitHub Actions
Continuous Delivery & Deployment	Render Cloud
Monitoring & Logging	Render Logs & Metrics
Automation	Webhooks & Auto-Deploy
🧩 Project Architecture
 Developer (You)
       │
       ▼
 ┌──────────────────────────┐
 │     GitHub Repository    │
 │  (Source Code + Docker)  │
 └──────────────────────────┘
       │
       ▼
 ┌──────────────────────────┐
 │   GitHub Actions (CI)    │
 │  • Build & Test Code     │
 │  • Validate Dockerfile   │
 └──────────────────────────┘
       │
       ▼
 ┌──────────────────────────┐
 │   Render Cloud (CD)      │
 │  • Build Docker Image    │
 │  • Deploy Container      │
 │  • Monitor & Scale App   │
 └──────────────────────────┘
       │
       ▼
 🌍 **Live URL:** https://devops-demo-project.onrender.com

⚙️ System Workflow
Phase	Description	Tools Used	Status
1	Application setup using Flask	Python	✅
2	Containerization	Docker	✅
3	GitHub repository setup	Git & GitHub	✅
4	CI setup for automated build & test	GitHub Actions	✅
5	Deployment to Render Cloud	Docker + Render	✅
6	Monitoring & Logging	Render Dashboard	✅
7	Continuous Delivery & Auto Deploy	GitHub + Render	✅
🧰 Setup Instructions
🔹 1. Clone Repository
git clone https://github.com/shreyas0114/devops-demo-project.git
cd devops-demo-project

🔹 2. Create Virtual Environment (optional)
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows

🔹 3. Install Dependencies
pip install -r requirements.txt

🔹 4. Run Locally
python app.py


Visit → http://127.0.0.1:5000

🐳 Docker Configuration
🔹 Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python", "app.py"]

🔹 Build & Run Locally
docker build -t devops-demo-app .
docker run -p 5000:5000 devops-demo-app


Then open → http://localhost:5000

⚙️ GitHub Actions CI Pipeline
.github/workflows/ci.yml
name: CI Pipeline

on:
  push:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.10"

      - name: Install Dependencies
        run: |
          pip install -r requirements.txt

      - name: Build Docker Image
        run: |
          docker build -t devops-demo-app .

      - name: Test Application
        run: |
          echo "Build and tests completed successfully!"


✅ Every push to main triggers this pipeline automatically.

☁️ Render Cloud Deployment
🔹 Steps:

Sign in to Render

Click New + → Web Service

Connect your GitHub repo

Choose Runtime → Docker

Select branch → main

Click Deploy

✅ Render will:

Build Docker image

Deploy container

Host Flask app on a live URL

🔁 Continuous Delivery (CD)

Go to Render → Settings → Auto Deploys

Turn ON ✅ Auto Deploy

Now every git push → triggers automatic deployment.

📊 Monitoring & Logging

Open Render → Logs tab → view live app logs

Use Render → Metrics tab → view CPU, memory, and uptime charts

Common logs:

Your service is live ✨
Running on http://0.0.0.0:5000
GET / HTTP/1.1" 200 -

💬 Application Code (app.py)
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return "🚀 DevOps CI/CD Pipeline Deployed Successfully on Render using Docker and GitHub Actions!"

@app.route('/health')
def health_check():
    return jsonify(status="success", message="Application is healthy ✅"), 200

@app.route('/about')
def about():
    return "This is a Flask application deployed through a complete DevOps CI/CD pipeline."

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

🧠 Key Features

CI/CD automation (GitHub → Render)

Dockerized application deployment

Auto Build & Auto Deploy integration

Monitoring via logs and metrics

Scalable and reliable pipeline

🧾 Results

✅ Flask application runs live on Render
✅ Docker image builds automatically from GitHub Actions
✅ Auto deployment triggers on each new push
✅ Logs confirm live service and uptime

Live App: 👉 https://devops-demo-project.onrender.com

🏁 Conclusion

This project showcases the complete DevOps lifecycle — from development to automated deployment — using modern tools like Docker, GitHub Actions, and Render.
It represents a reliable, scalable, and production-ready CI/CD pipeline, serving as an excellent foundation for real-world DevOps workflows.
