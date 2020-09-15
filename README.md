# airflow

<img src="https://img.shields.io/badge/docker-ready-blue.svg"/>

<br>
<br>

This repository is some experimental work being performed on Airflow. 
At the root of is the [airflow.yml](airflow.yml) file which is a 
[docker-compose](https://docs.docker.com/compose/) configuration (`version 3.7`) file.

Accompanying the [airflow.yml](airflow.yml) file, is the [.env](example.env) configuration
file which has a temporary placeholder, [example.env](example.env). 

### Docker Compose

#### Services

- airflow
    - [puckel/docker-airflow:1.10.9](https://hub.docker.com/r/puckel/docker-airflow)
 - airflow backend database
    - [postgres:9.6](https://hub.docker.com/_/postgres)


<img src="https://www.pngitem.com/pimgs/m/27-272595_docker-compose-docker-compose-logo-hd-png-download.png" alt="drawing" width="400"/>

### Startup

1) Clone or rename the [example.env](example.env) -> `.env`
    ```bash
    cp example.env .env
    ```
2) Populate placeholder values, if any, on `.env`
3) Start the multi-container Docker application.
    ```bash
   docker-compose up
   ```
   
<br/>
   
Helpful Links:
 - [Airflow Documentation](https://airflow.apache.org/docs/stable/)
 - [Airflow Source Code](https://github.com/apache/airflow/)
 - [Airflow Docker Image](https://hub.docker.com/r/puckel/docker-airflow)
        
<br/>
<br/>

###### Cool stuff happens in Denver, CO <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Flag_of_Denver%2C_Colorado.svg/800px-Flag_of_Denver%2C_Colorado.svg.png" width=25/>

<br/>
<br/>