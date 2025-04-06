# ContactBook JS App + RESTful API + Terraform on Azure

### Description  
This project is part of an exercise from the Containers and Cloud course at SoftUni.  
The goal is to deploy the **Contact Book** Node.js application on **Microsoft Azure** using **Terraform**.

The app holds a searchable list of contacts and provides both a web interface and a RESTful API.  
> The app uses in-memory storage – it has **no database**, and data is **not persistent**.

The infrastructure includes:
- Creating a **Resource Group**
- Creating an **App Service Plan**
- Creating an **App Service**
- Deploying the **Contact Book** app to Azure from a **GitHub repository**

---

## Features

### Web App (Node.js + Express.js + Pug)
- List all contacts: `/contacts`
- View a single contact by ID: `/contacts/:id`
- Search for a contact: `/contacts/search/:keyword`
- Add a new contact: `/contacts/create`

### RESTful API Endpoints
- `GET /api` – list all API endpoints
- `GET /api/contacts` – list all contacts
- `GET /api/contact/:id` – get a contact by ID
- `GET /api/contacts/search/:keyword` – search contacts by keyword
- `POST /api/contacts` – create a new contact  
  Example request body:
  ```json
  {
    "firstName": "Marie",
    "lastName": "Curie",
    "email": "marie67@gmail.com",
    "phone": "+1 800 200 300",
    "comments": "Old friend"
  }
