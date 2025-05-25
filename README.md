# 🚗 Real-Time Accident Data Processing 🚗

## Table of Contents
1. [Project Overview](#1-project-overview)
2. [Architecture](#2-architecture)
3. [Technologies Used](#3-technologies-used)
4. [Data Sources](#4-data-sources)
5. [ETL Process](#5-etl-process)
6. [Database Systems](#6-database-systems)
7. [Optimization Techniques](#7-optimization-techniques)
8. [Dashboards](#8-dashboards)
9. [Setup and Installation](#9-setup-and-installation)
10. [Usage](#10-usage)
11. [Why This Stack?](#why-this-stack)

---

## 1. Project Overview
**🚗 Real-Time Accident Data Processing 🚗** is designed to showcase a real-time and batch data pipeline using Docker and technologies like PySpark, Kafka, MySQL, and Jupyter. The project contains the following:

- A **Docker-Compose** setup that launches a PySpark Jupyter environment, Zookeeper, Kafka, and MySQL.
- Streaming data source simulated for real-time data ingestion using Kafka.
- Batch data source processed in a Jupyter notebook using Pandas.
- An ETL pipeline for processing both real-time and batch data, transforming the data with PySpark, and loading it into MySQL.
- Power BI Dashboards for visualizing the data insights in real-time.

The goal of this project is to demonstrate how to effectively build a scalable pipeline to process both real-time and batch data.

---

## 2. Architecture
The architecture includes the following components:

1. **Kafka and Zookeeper**: Kafka is used to handle the ingestion of real-time streaming data, while Zookeeper manages Kafka’s configuration.
2. **PySpark**: PySpark processes both the real-time streaming data from Kafka and batch data.
3. **MySQL**: The transformed data is loaded and stored in MySQL.
4. **Jupyter Notebooks**: Jupyter notebooks are used for batch data processing using Pandas and SQLAlchemy.
5. **Power BI**: Power BI connects to the MySQL database for real-time and batch data visualization, creating dashboards that offer insights into accident patterns, frequency, and trends.


---

## 3. Technologies Used
- **Docker**: To containerize and run all services, ensuring consistency and easy deployment.
- **Kafka**: For ingesting and streaming real-time data.
- **Zookeeper**: To manage Kafka clusters.
- **PySpark**: For real-time and batch data transformations.
- **MySQL**: To store the transformed data as a relational database.
- **Pandas & SQLAlchemy**: For batch ETL operations and loading data into MySQL.
- **Power BI**: For creating real-time dashboards connected to MySQL, enabling users to track accident data in near real-time.
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
**Power BI** is used to visualize both real-time streaming and batch data stored in MySQL. Power BI provides interactive, user-friendly dashboards, which can be refreshed to provide up-to-date insights from the streaming data pipeline.

- **Real-Time Accident Dashboard**: Displays real-time accident data ingestion, with updates in near real-time based on the data flowing through Kafka and PySpark.
- **Batch Data Dashboard**: Provides a detailed overview of batch data, highlighting trends and patterns over time.

These dashboards enable you to easily monitor and analyze accident data trends and make data-driven decisions.

---

## 9. Setup and Installation

### Prerequisites:
- Docker installed on your machine.
- Docker Compose installed.

### Steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Yosofhatem/Traffic_DWH.git
   cd Traffic_DWH
   ```

2. **Start the Docker containers:**
   ```bash
   docker-compose up -d
   ```

3. **Access the Kafka container:**
   - Open a terminal and retrieve the container ID or use the Kafka container name (e.g., `ed-kafka`):
     ```bash
     docker ps
     ```
   - Enter the Kafka container:
     ```bash
     docker exec -it [container id or ed-kafka] /bin/bash
     ```

4. **Create the `accident-data` topic:**
   - Run the following command inside the Kafka container:
     ```bash
     kafka-topics --create --topic accident-data --bootstrap-server localhost:29092
     ```

5. **Verify the topic creation:**
   - List the topics to confirm `accident-data` was created:
     ```bash
     kafka-topics --list --bootstrap-server localhost:29092
     ```

6. **Open Jupyter Notebook:**
   - Access Jupyter by visiting [http://localhost:8889](http://localhost:8889) and using the token from the Docker logs.

7. **Upload necessary files:**
   - Upload the following files to the Jupyter environment:
     - `accident_events.py`
     - `AccidentDataProcessor.ipynb`
     - `post_to_Kafka.py`

8. **Install Kafka for Python:**
   - Open a terminal in Jupyter and run the following command to install the required Python Kafka library:
     ```bash
     pip install kafka-python
     ```

9. **Connect to the MySQL database:**
   - Open your preferred database client (MySQL Workbench, Visual Studio Code Database Client, etc.).
   - Use the following configuration to connect:
     - **Connection Name:** Any name
     - **Host:** 127.0.0.1 or localhost
     - **Port:** 3307
     - **User:** root
     - **Password:** 123456
   - Execute the `incidents_Schema.sql` file to set up the data warehouse schema.

10. **Run the Jupyter Notebook:**
    - Start running `AccidentDataProcessor.ipynb` cell by cell until you reach the loading function.

11. **Generate data for the Kafka topic:**
    - In the terminal, run the following command to start generating data:
      ```bash
      python post_to_Kafka.py
      ```

12. **Complete the notebook execution:**
    - Run the remaining cells in the notebook.

And voilà, it works! 😊


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

## Why This Stack?

### 1. PySpark vs. Hadoop (MapReduce)
**PySpark** was chosen over **Hadoop’s MapReduce** for several key reasons, especially for this project:

-  **Performance**: PySpark’s in-memory processing capabilities offer a significant performance improvement over Hadoop’s disk-based processing. PySpark can be **up to 100x faster** than Hadoop MapReduce.
  
-  **Ease of Use**: PySpark has a more intuitive API in Python, making it easier to implement complex transformations.

-  **Unified Processing**: Spark handles both **batch and streaming data** in one framework, making it highly versatile, whereas Hadoop would require multiple tools.

### 2. MySQL vs. PostgreSQL
While both MySQL and PostgreSQL are widely used relational databases, **MySQL** was chosen for:

-  **Widespread Adoption**: MySQL is the most widely adopted open-source database with great support for ETL and BI tools.

-  **Speed**: MySQL’s **write performance** can be faster than PostgreSQL, especially for simple transactional operations, which is key for real-time data.

-  **Scalability**: MySQL supports **row-level locking** and better concurrency handling for high-throughput systems like this.

### 3. Kafka for Streaming
**Kafka** was selected for handling the streaming aspect:

-  **Fault Tolerance & Scalability**: Kafka processes **millions of messages per second** with low latency and horizontal scalability.
  
-  **Partitioning**: Kafka ensures data parallelism, improving data throughput with PySpark by reading from multiple partitions simultaneously.

-  **Durability**: Kafka persists messages to disk and allows message replay for fault recovery.

### 4. Streaming with MySQL
Although traditionally used for OLTP, **MySQL** was chosen for streaming due to:

-  **Write Performance**: With **InnoDB**, MySQL supports high-throughput writes, compatible with real-time data processing.

-  **Scalability**: Modern MySQL with **sharding** and **replication** ensures it scales well with large streaming volumes.

-  **Efficient Storage**: MySQL uses **row-based storage** and efficient indexing, ensuring fast access patterns for both reads and writes.

### 5. Pandas and SQLAlchemy for Batch Processing
**Pandas** and **SQLAlchemy** were chosen for batch processing for the following reasons:

-  **Performance**: Pandas is fast and powerful for handling **small to medium-sized datasets**.
  
-  **Ease of Use**: Pandas allows for quick data manipulation, and SQLAlchemy simplifies database interaction with MySQL.

### 6. Docker for Containerization
**Docker** simplifies the deployment and management of this project:

-  **Consistency Across Environments**: Docker ensures that the stack runs consistently across various environments.

-  **Scalability**: Easily scale containers for Kafka brokers or PySpark workers as the data load grows.

-  **Rapid Deployment**: Docker speeds up the setup process, making it easier for contributors to get up and running.

### 7. Jupyter for Interactive Development
**Jupyter Notebooks** was chosen for batch processing and exploration:

-  **Interactive Environment**: Jupyter allows for quick experimentation, ETL tasks, and exploration of batch data.

-  **Visualization**: Jupyter provides powerful data visualization capabilities for analyzing trends in batch data.
