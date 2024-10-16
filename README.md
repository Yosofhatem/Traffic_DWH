# 🚗 Real-Time Accident Data Processing 🚗

## Table of Contents
1. [Project Overview](#project-overview)
2. [Architecture](#architecture)
3. [Technologies Used](#technologies-used)
4. [Data Sources](#data-sources)
5. [ETL Process](#etl-process)
6. [Database Systems](#database-systems)
7. [Optimization Techniques](#optimization-techniques)
8. [Dashboards](#dashboards)
9. [Setup and Installation](#setup-and-installation)
10. [Usage](#usage)
11. [Contributing](#contributing)

---

## 1. Project Overview
**🚗 Real-Time Accident Data Processing 🚗** is designed to showcase a real-time and batch data pipeline using Docker and technologies like PySpark, Kafka, MySQL, and Jupyter. The project contains the following:

- A **Docker-Compose** setup that launches a PySpark Jupyter environment, Zookeeper, Kafka, and MySQL.
- Streaming data source simulated for real-time data ingestion using Kafka.
- Batch data source processed in a Jupyter notebook using Pandas.
- An ETL pipeline for processing both real-time and batch data, transforming the data with PySpark, and loading it into MySQL.

The goal of this project is to demonstrate how to effectively build a scalable pipeline to process both real-time and batch data.

---

## 2. Architecture
The architecture includes the following components:

1. **Kafka and Zookeeper**: Kafka is used to handle the ingestion of real-time streaming data, while Zookeeper manages Kafka’s configuration.
2. **PySpark**: PySpark processes both the real-time streaming data from Kafka and batch data.
3. **MySQL**: The transformed data is loaded and stored in MySQL.
4. **Jupyter Notebooks**: Jupyter notebooks are used for batch data processing using Pandas and SQLAlchemy.

---

## 3. Technologies Used
- **Docker**: To containerize and run all services, ensuring consistency and easy deployment.
- **Kafka**: For ingesting and streaming real-time data.
- **Zookeeper**: To manage Kafka clusters.
- **PySpark**: For real-time and batch data transformations.
- **MySQL**: To store the transformed data as a relational database.
- **Pandas & SQLAlchemy**: For batch ETL operations and loading data into MySQL.
- **Jupyter Notebooks**: For interactive development and analysis of batch data.

---

## 4. Data Sources
- **Streaming Data**: Simulated accident data is continuously generated and pushed into Kafka topics.
- **Batch Data**: Static datasets (e.g., CSV, JSON) are loaded and processed using Pandas in Jupyter notebooks.

---

## 5. ETL Process
### Streaming Data
1. **Extract**: Kafka streams real-time data into PySpark.
2. **Transform**: Data is cleaned and aggregated in real-time using PySpark.
3. **Load**: The transformed data is loaded into MySQL.

### Batch Data
1. **Extract**: Data is loaded from a static source (e.g., CSV) using Pandas.
2. **Transform**: Data is cleaned and preprocessed in the Jupyter notebook.
3. **Load**: The batch data is inserted into MySQL using SQLAlchemy.

---

## 6. Database Systems
**MySQL** is used for storing both streaming and batch-transformed data due to its ease of use, compatibility with various ETL tools, and support for complex queries and transactions.

---

## 7. Optimization Techniques
- **Kafka**: Configured with multiple partitions for scalability and fault-tolerance.
- **PySpark**: Provides distributed processing capabilities for real-time and batch data, enhancing performance.
- **Batch Processing**: Pandas is used for small to medium-sized datasets, while PySpark handles the larger streaming data loads.

---

## 8. Dashboards
You can visualize the data using a BI tool such as **Tableau** or **Power BI**, which can connect to the MySQL database to display real-time data insights and batch trends.

---

## 9. Setup and Installation

### Prerequisites:
- Docker installed on your machine.
- Docker Compose installed.

### Steps:
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Start the Docker containers:
   ```bash
   docker-compose up
   ```

3. Open Jupyter Notebook:
   Access the Jupyter environment by visiting `http://localhost:8888` in your browser.

4. Interact with the services:
   - Kafka is available at `localhost:9092`
   - MySQL is available at `localhost:3306`

---

## 10. Usage

### Streaming Data Pipeline:
1. Publish simulated data to Kafka.
2. PySpark will consume the data from Kafka, apply transformations, and load it into MySQL.

### Batch Data Pipeline:
1. Open the Jupyter notebook in your browser.
2. Load, clean, and transform batch data using Pandas.
3. Load the transformed data into MySQL using SQLAlchemy.

---

## 11. Contributing
Contributions are welcome! Feel free to submit issues or pull requests to improve the project. Please make sure any changes are well-documented and tested.

---

## Why This Stack?

### Kafka and PySpark
Kafka’s robust messaging system handles real-time streaming efficiently. Paired with PySpark’s distributed processing, this setup enables scalable, fault-tolerant ingestion and transformation of real-time data.

### MySQL
MySQL is a proven and widely adopted relational database, making it ideal for storing the structured data generated from the ETL processes.

### Pandas and SQLAlchemy
For batch processing, Pandas is a powerful tool for data manipulation, while SQLAlchemy provides an easy way to interact with MySQL from Python.

### Docker
Docker simplifies the environment setup by ensuring all dependencies and services (Kafka, Zookeeper, PySpark, MySQL, Jupyter) are isolated and easy to manage. It also makes deployment and scaling straightforward.
