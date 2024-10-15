# 🚗 Real-Time Accident Data Processing with Kafka, Spark, and MySQL 🚗

Welcome to the **Real-Time Accident Data Processing** project, a scalable pipeline that simulates and processes real-time accident events. This project is designed to showcase the integration of streaming data technologies such as **Kafka**, **PySpark**, and **MySQL**, with a fully containerized solution powered by **Docker**.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Architecture](#architecture)
- [Components](#components)
  - [Kafka](#kafka)
  - [Spark Streaming](#spark-streaming)
  - [MySQL Database](#mysql-database)
  - [Docker](#docker)
- [Setup and Usage](#setup-and-usage)
  - [Prerequisites](#prerequisites)
  - [Steps](#steps)
- [Future Improvements](#future-improvements)


---
## 🔍 Overview

This project simulates accident events, streams the data using **Kafka**, processes it using **PySpark Streaming**, and stores the results in a **MySQL** database. All services, including Kafka, Spark, and MySQL, are containerized using Docker, ensuring that the entire pipeline can be easily set up and run with minimal configuration.

The key objectives of this project are:
- To simulate real-time accident data generation.
- To process streaming data using PySpark.
- To store processed data in a relational database for further analysis.

---

## 📂 Project Structure

├── kafka/

│   ├── accident_events.py            # Generates data for streaming

│   ├── post_to_kafka.py              # Posts data to Kafka

│

├── notebooks/

|      └── Spark_Processing

│               └── Accident_data_processor.ipynb  # Processes data using Spark Streaming

│

├── schema/

│   └── Incident_Schema.sql            # Database schema for MySQL

│

├──  docker-compose.yml              # Docker configuration for Kafka, Spark, and MySQL




---

## 🛠️ Components

### 1. **Kafka**
Kafka is used to stream real-time accident events. Two scripts manage this:
- **`accident_events.py`**: Simulates accident data including fields like date, time, severity, and location.
- **`post_to_kafka.py`**: Publishes the generated events to a Kafka topic.

### 2. **Spark Streaming**
**PySpark** processes the incoming data streams:
- **`Accident_data_processor.ipynb`**: A Jupyter notebook that listens to the Kafka topic, processes the data, and writes it to a MySQL database using Spark Streaming.

### 3. **MySQL Database**
The MySQL database stores processed accident data:
- **`Incident_Schema.sql`**: Defines the schema for storing the processed data, including the structure of the fact and dimension tables.

### 4. **Docker**
Docker is used to containerize all services for easy deployment:
- **`docker-compose.yml`**: Configures and runs Kafka, Zookeeper, Spark, and MySQL in containers.

---

## 🚀 Setup and Usage

### Prerequisites
- **Docker** and **Docker Compose** installed on your system.

### Steps

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/Yosofhatem/Traffic_DWH.git
   cd Traffic_DWH


2. **Launch the Docker Services:**

   In the root of your project directory, run the following command to spin up Kafka, Spark, and MySQL:
   
   ```bash
   docker-compose up
