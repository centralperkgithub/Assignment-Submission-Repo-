## Full-Stack Application Containerization with Docker: React, Express, and MongoDB
This project demonstrates how to containerize a full-stack web application using Docker. The application consists of a React frontend, an Express backend, and a MongoDB database. Docker and Docker Compose are used to manage the setup, making it easy to deploy and run the app in isolated containers.

Table of Contents
Project Overview
Prerequisites
Getting Started
Docker Setup
Frontend Dockerfile
Backend Dockerfile
Docker Compose
Running the Application
Testing the Application
Additional Information
Project Overview
The goal of this project is to package a full-stack application into containers to simplify deployment and improve manageability. With Docker Compose, we can launch all components—frontend, backend, and database—simultaneously with a single command.

Prerequisites
Before starting, ensure you have:

Docker installed.
A Docker Hub account (for image storage if needed).
A .env file in the root directory containing the MongoDB connection string and other environment variables. Example:
dotenv
Copy code
MONGO_URI=mongodb://mongo:27017/sampleApp
PORT=5000
Getting Started
Clone the repository:

bash
Copy code
git clone https://github.com/fliprlab/devops-task.git
cd devops-task
Create a .env file: In the root directory, create a .env file with the MongoDB URI:

plaintext
Copy code
MONGO_URI=mongodb://mongo:27017/sampleApp
PORT=5000
Docker Setup
This project contains Dockerfiles for the frontend and backend and a Docker Compose file to manage all services.

Frontend Dockerfile
The frontend Dockerfile is located in the frontend directory. It:

Uses a Node.js base image to build the React app.
Copies the app code and installs dependencies.
Builds the React application for production.
Uses Nginx to serve the built files.
Backend Dockerfile
The backend Dockerfile is located in the backend directory. It:

Uses a Node.js base image to run the Express backend.
Copies the backend code and installs dependencies.
Exposes port 5000 for the backend API.
Specifies the command to start the Express server.
Docker Compose
The docker-compose.yml file in the root directory defines services for:

Frontend: Exposed on port 3000.
Backend: Exposed on port 5000, connects to MongoDB.
MongoDB: Database service, data persisted in a Docker volume.
The file sets up network connections and environment variables needed for the services to communicate.

Running the Application
Build and Start Containers: Run the following command to build and start all services:

bash
Copy code
docker-compose up --build -d
Check Container Status: Ensure all containers are running:

bash
Copy code
docker-compose ps
Access the Application:

Frontend: http://localhost:3000
Backend: http://localhost:5000
Testing the Application
Verify MongoDB Connection: The backend should connect to MongoDB, logging MongoDB Connected if successful. You can view logs with:

bash
Copy code
docker-compose logs backend
API Endpoints: Use the following endpoints to test the backend API:

GET /api/users - Fetches all users.
POST /api/users - Adds a new user (send JSON data with name and email fields).
Example POST request using curl:

bash
Copy code
curl -X POST http://localhost:5000/api/users -H "Content-Type: application/json" -d '{"name": "John Doe", "email": "john@example.com"}'
Frontend: Visit http://localhost:3000 to interact with the React app.

Additional Information
Rebuild Containers: If you make changes to the code, rebuild the containers:

bash
Copy code
docker-compose up --build -d
Stop Containers:

bash
Copy code
docker-compose down
Logs: View logs for each container:

bash
Copy code
docker-compose logs frontend
docker-compose logs backend
This setup provides a development and deployment-friendly environment for running a full-stack application in isolated Docker containers.
