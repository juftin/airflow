FROM apache/airflow:2.1.3-python3.8 as apache_airflow

MAINTAINER Justin Flannery "juftin@juftin.com"
LABEL version="0.0.1"
LABEL description="juftin/airflow, be one with the flow!"

FROM apache_airflow AS build_install

COPY packages.txt packages.txt
USER root
RUN apt-get update \
  && apt-get autoremove -yqq --purge \
  && cat packages.txt | xargs apt-get install -y --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm packages.txt
USER airflow

RUN pip install --no-cache-dir --upgrade pip wheel
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt

FROM apache_airflow AS base_airflow

COPY --from=build_install /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
COPY --from=build_install /usr/local/bin /usr/local/bin

FROM base_airflow AS juftin_airflow

ENV AIRFLOW__CORE__DAGS_ARE_PAUSED_AT_CREATION='true'
ENV AIRFLOW__CORE__LOAD_EXAMPLES='false'
ENV AIRFLOW__API__AUTH_BACKEND='airflow.api.auth.backend.basic_auth'
