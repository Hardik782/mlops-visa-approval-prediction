# MLOps Visa Approval Prediction

## Overview

This project implements an end-to-end MLOps pipeline for predicting visa approval outcomes using machine learning. The system automates data ingestion, validation, transformation, model training, evaluation, and deployment. A FastAPI-based web application provides an interface for generating predictions, while GitHub Actions automates containerized deployment to AWS.

---

## Features

* End-to-end machine learning training pipeline
* Automated data ingestion from MongoDB
* Schema validation and dataset drift detection
* Data preprocessing and feature engineering
* Automated model selection and evaluation
* Performance-based model deployment to AWS S3
* FastAPI web application for real-time predictions
* Dockerized deployment workflow
* CI/CD automation using GitHub Actions, AWS ECR, and a self-hosted runner

---

## Architecture

### Training Pipeline

```text
                 MongoDB
                     │
                     ▼
             Data Ingestion
                     │
                     ▼
             Data Validation
                     │
                     ▼
           Data Transformation
                     │
                     ▼
             Model Training
                     │
                     ▼
            Model Evaluation
                     │
                     ▼
                 AWS S3
```

### Prediction Pipeline

```text
 User Input
      │
      ▼
 FastAPI Application
      │
      ▼
 Load Model From AWS S3
      │
      ▼
 Prediction
      │
      ▼
 Prediction Result
```

### Deployment Architecture

```text
Developer Push
       │
       ▼
GitHub Repository
       │
       ▼
GitHub Actions
       │
       ▼
Docker Image Build
       │
       ▼
AWS ECR
       │
       ▼
EC2 Self-Hosted Runner
       │
       ▼
Docker Container
       │
       ▼
FastAPI Application
```

---

## Technology Stack

### Machine Learning

* Scikit-learn
* Pandas
* NumPy
* Imbalanced-learn
* Evidently

### Backend

* FastAPI
* Jinja2
* Uvicorn

### Database & Cloud

* MongoDB
* AWS S3
* AWS ECR
* AWS EC2

### DevOps

* Docker
* GitHub Actions

---

## Installation

### Clone Repository

```bash
git clone <repository-url>
cd mlops-visa-approval-prediction
```

### Create Environment

```bash
conda create -n env python=3.10 -y
conda activate env
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

---

## Environment Variables

Configure the following environment variables before running the application:

```text
MONGODB_URL
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

---

## Running the Application

Start the FastAPI application:

```bash
python app.py
```

Open:

```text
http://localhost:8080
```

---

## Training Workflow

The training pipeline performs the following steps:

1. Extracts visa application data from MongoDB.
2. Validates dataset schema and detects data drift.
3. Applies preprocessing and feature engineering.
4. Trains and evaluates candidate machine learning models.
5. Compares the newly trained model with the currently deployed model.
6. Deploys the model to AWS S3 only if performance improves.

To trigger training:

```text
http://localhost:8080/train
```

---

## Prediction Workflow

Users can submit visa application details through the web interface. The application loads the latest deployed model, processes the input data, and returns a visa approval prediction.

---

## CI/CD Pipeline

The repository includes a GitHub Actions workflow that automates deployment.

Workflow steps:

1. Build Docker image
2. Push image to AWS ECR
3. Pull latest image on EC2 self-hosted runner
4. Restart application container

### Required GitHub Secrets

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION
ECR_REGISTRY
ECR_REPOSITORY
MONGODB_URL
```

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Disclaimer

This project was developed for educational, learning, and portfolio purposes.
