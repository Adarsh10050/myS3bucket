# AWS S3 Static Website Hosting using Terraform

This project demonstrates how to host a static website on **AWS S3** using **Terraform** as Infrastructure as Code (IaC).  
It is a beginner-friendly cloud project focused on automation, AWS basics, and DevOps practices.

---

## 🚀 Project Overview

- Created an S3 bucket using Terraform
- Enabled static website hosting
- Configured public read access
- Uploaded `index.html` and `error.html`
- Accessed the website via S3 website endpoint
- Entire infrastructure managed using Terraform

---

## 🛠️ Technologies Used

- **AWS S3**
- **Terraform**
- **HTML & CSS**
- **Git & GitHub**

---

## 📂 Project Structure
```
mys3staticwebsite/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── index.html
├── error.html
├── .gitignore
└── README.md
```

---

## ⚙️ Terraform Resources Used

- `aws_s3_bucket`
- `aws_s3_bucket_acl`
- `aws_s3_bucket_public_access_block`
- `aws_s3_bucket_ownership_controls`
- `aws_s3_bucket_website_configuration`
- `aws_s3_object`

---

## ▶️ How to Run This Project

### 1️⃣ Configure AWS
Make sure AWS CLI is configured:
```bash
aws configure
```
### 2️⃣ Initialize Terraform
```bash
terraform init
```
### 3️⃣ Plan the Infrastructure
```bash
terraform plan
```
### 4️⃣ Apply the Configuration
```bash
terraform apply -auto-approve
```
### 🌐 Website Access
```bash
http://<bucket-name>.s3-website-<region>.amazonaws.com
```
## 👤 Author
```bash
Adarsh Kumar
Aspiring Cloud & DevOps Engineer
📍 India
```



