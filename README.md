## googlecloudplatform
Google Cloud Platform

# 1. Introdução

O objetivo deste projeto é compilar informações e tutoriais mais interessantes do **GPC - Google Cloud Platform** e sobre o primeiro nivel de certificação **Associate Cloud Engineer**:

* [Road Map to Associate Cloud Engineer](#road-map-to-associate-cloud-engineer)
* [Browse Tutorial](#41-browse-tutorials)
* [Google Cloud SDK - Command Line Tool](#42-google-cloud-sdk---command-line-tool)
  * [GCloud SDK - login and config](#421-gcloud-sdk---login-and-config)
  * [GCloud SDK - components installation](#422-GCloud-SDK---components-installation)
* [Google Cloud Compute Engine](#43-Google-Cloud-Compute-Engine)
  * [GCloud Compute Engine - NGinx](#gcloud-compute-engine---nginx)
  * [GCloud Compute Engine - Jenkins using Docker](#gcloud-compute-engine---jenkins-using-docker)
  * [GCloud Compute Engine - Bamboo using Docker](#gcloud-compute-engine---bamboo-using-docker)
  * [GCloud Compute Engine - Hercules MVS 3.8 turnkey-4-system](#gcloud-compute-engine---Hercules-MVS-3.8-turnkey-4-system)
* [Google APP Engine](#43-Google-APP-Engine)
  * [GCloud App Engine - Python Hello World](#gcloud-app-engine---Python-Hello-World)
### App Engine - Python Hello World
* [Referências](#i---referencias)

# 2. Premissas

* [Uma conta ativa no Google Cloud Plataform - GCloud][https://cloud.google.com/]

# 3. Road Map to Associate Cloud Engineer

* [Study Plan](https://docs.google.com/spreadsheets/d/1_7C9r3-O2EnxrYHIr08rtd_W807kT5U3tUPAyVocUjg)

# 4. Tutoriais

## 4.1. Browse Tutorials

* [Browse Tutorials](https://cloud.google.com/community/tutorials/)

## 4.2. Google Cloud SDK - Command Line Tool

## 4.2.1. GCloud SDK - login and config

```gcloud-shell
gcloud auth login                          # Inicia o browser Chrome ou solicita autenticação pelo browser
gcloud config list                         # Show configurations set: project, region, zone, etc.
gcloud config set compute/region us-west1  # setting region 
gcloud config set compute/zone us-west1-a  # ... and zone
```

## 4.2.2. GCloud SDK - components installation

* References: 
  * [Youtube Kubernetes + Google Cloud + Docker: Getting Started](https://www.youtube.com/watch?v=GTRS9zRWs80&t=217s)

* Step 01: List all components installed on Google Cloud SDK

```gcloud-shell
gcloud components list
Your current Cloud SDK version is: 253.0.0
The latest available version is: 253.0.0
+------------------------------------------------------------------------------------------------------------+
|                                                 Components                                                 |
+---------------+------------------------------------------------------+--------------------------+----------+
|     Status    |                         Name                         |            ID            |   Size   |
+---------------+------------------------------------------------------+--------------------------+----------+
| Not Installed | App Engine Go Extensions                             | app-engine-go            | 56.9 MiB |
| Not Installed | Cloud Bigtable Command Line Tool                     | cbt                      |  6.2 MiB |
| Not Installed | Cloud Bigtable Emulator                              | bigtable                 |  6.4 MiB |
| Not Installed | Cloud Datalab Command Line Tool                      | datalab                  |  < 1 MiB |
| Not Installed | Cloud Datastore Emulator                             | cloud-datastore-emulator | 18.4 MiB |
| Not Installed | Cloud Datastore Emulator (Legacy)                    | gcd-emulator             | 38.1 MiB |
| Not Installed | Cloud Firestore Emulator                             | cloud-firestore-emulator | 41.1 MiB |
| Not Installed | Cloud Pub/Sub Emulator                               | pubsub-emulator          | 34.8 MiB |
| Not Installed | Cloud SQL Proxy                                      | cloud_sql_proxy          |  3.5 MiB |
| Not Installed | Emulator Reverse Proxy                               | emulator-reverse-proxy   | 14.5 MiB |
| Not Installed | Google Container Registry's Docker credential helper | docker-credential-gcr    |  1.8 MiB |
| Not Installed | gcloud Alpha Commands                                | alpha                    |  < 1 MiB |
| Not Installed | gcloud app Java Extensions                           | app-engine-java          | 85.9 MiB |
| Not Installed | gcloud app PHP Extensions                            | app-engine-php           | 19.1 MiB |
| Not Installed | gcloud app Python Extensions                         | app-engine-python        |  6.0 MiB |
| Not Installed | gcloud app Python Extensions (Extra Libraries)       | app-engine-python-extras | 28.5 MiB |
| Not Installed | kubectl                                              | kubectl                  |  < 1 MiB |
| Installed     | BigQuery Command Line Tool                           | bq                       |  < 1 MiB |
| Installed     | Cloud SDK Core Libraries                             | core                     | 11.0 MiB |
| Installed     | Cloud Storage Command Line Tool                      | gsutil                   |  3.6 MiB |
| Installed     | gcloud Beta Commands                                 | beta                     |  < 1 MiB |
+---------------+------------------------------------------------------+--------------------------+----------+
To install or remove components at your current SDK version [253.0.0], run:
  $ gcloud components install COMPONENT_ID
  $ gcloud components remove COMPONENT_ID

To update your SDK installation to the latest version [253.0.0], run:
  $ gcloud components update
```

* Step 02: Install `kubectl` component

```gcloud-shell
gcloud components install kubectl
  :
Your current Cloud SDK version is: 253.0.0
Installing components from version: 253.0.0
+---------------------------------------------------------------------+
|                 These components will be installed.                 |
+---------------------+------------------------+----------------------+
|         Name        |        Version         |         Size         |
+---------------------+------------------------+----------------------+
| kubectl             |             2019.06.28 |              < 1 MiB |
| kubectl             |                 1.12.9 |             64.9 MiB |
+---------------------+------------------------+----------------------+
For the latest full release notes, please visit:
  https://cloud.google.com/sdk/release_notes
Do you want to continue (Y/n)?  Y
#============================================================#
#= Creating update staging area                             =#
#============================================================#
  :
```

* Step 03: Enable `Container Engine` on `GCloud Console >> API e Serviços >> Biblioteca`

* Step 04: Busque na pesquisa por `Kubernetes Engine API` e clique no botão `ativar` caso esteja desativada




## 4.3. Google Cloud Compute Engine

### GCloud Compute Engine - NGinx

* Step-01: Create Firewall rules:

```gcloud-shell
gcloud compute firewall-rules create allow-http \
  --target-tags http-server \
  --allow tcp:80
```

* Step-02: Run Container

```gcloud-shell
gcloud beta compute instances create-with-container nginx-vm \
  --tags http-server \
  --container-image nginx:alpine \
  --zone us-east1-c
```

* Step-03: List all running container and stop running container

```gcloud-shell
gcloud beta compute instances list
gcloud beta compute instances stop   nginx-vm --zone us-east1-c
gcloud beta compute instances delete nginx-vm --zone us-east1-c
```



### GCloud Compute Engine - Jenkins using Docker

* References:
  * [Running Jenkins server Using Docker](https://github.com/GoogleCloudPlatform/jenkins-docker/blob/master/2/README.md)

* Step 01: Edit `vim docker-compose-jenkis.yml`

```gcloud-shell
version: '2'
services:
  jenkins:
    container_name: some-jenkins
    image: launcher.gcr.io/google/jenkins2
    ports:
      - '8080:8080'
      - '50000:50000'
```

* Step 02: Run docker-compose file to up deamon mode

```gcloud-shell
docker-compose -f docker-compose-jenkis.yml up -d
```

* Step 03: Get Jenkins Password 

```gcloud-shell
docker exec some-jenkins cat /var/jenkins_home/secrets/initialAdminPassword
17935ab97cd14a298654bc02afcf5531
```


* Step 04: Execute First Login
  * Clique em `Visualizar`
  * No formulário `Getting Started - Unlock Jenkins` você deve Informar a password obtida no passo anterior
  * No formulário `Getting Started - Customize Jenkins` você deve clicar no botão `Install Suggested Plugins`
  * No formulário `Getting Started - Create First Admini User` você deve criar o usuário `admin` com senha `admin`
  * No formulário `Getting Started - Instance Configuration` você deve clicar no botão `Save and Finish`

* Step 05: Verificar a instancia sendo executada

```gcloud-shell
docker ps
CONTAINER ID        IMAGE                             COMMAND                  PORTS                                              NAMES
5ada4a040add        launcher.gcr.io/google/jenkins2   "/bin/tini -- /usr/l…"   0.0.0.0:8080->8080/tcp, 0.0.0.0:50000->50000/tcp   some-jenkins
```

* Step 06: Parar o serviço do Jenkins

```gcloud-shell
docker stop some-jenkins
```

* Step 07: Add persistence to Jenkins

* All Jenkins data lives in `/var/jenkins_home`

```gcloud-shell

````


### GCloud Compute Engine - Bamboo using Docker

* References:
  * [Running Bamboo server Using Docker](https://hub.docker.com/r/atlassian/bamboo-server/)

* Step 01: Create Bamboo volume `under construction`

```gcloud-shell
docker volume create bamboo-server
```



### GCloud Compute Engine - Hercules MVS 3.8 turnkey-4-system

* References:
  * [Reading Pre-requisites](https://hub.docker.com/r/hermajordoctor/hercules)


* Step 01: Download image

```gcloud-shell
docker pull hermajordoctor/hercules
```

* Step 02: Configure firewall-rules

```gcloud-shell
gcloud compute firewall-rules create allow-hercules \
  --target-tags hercules \
  --allow tcp:3270,tcp:8081

gcloud compute firewall-rules list
```

* Step 03: Run Container

```gcloud-shell
gcloud beta compute instances create-with-container hercules \
  --tags hercules \
  --container-image hermajordoctor/hercules \
  --zone us-east1-c
```

* Step 04: List running Container

```gcloud-shell
gcloud beta compute instances list
```

* Step 05: Stop running Container

```gcloud-shell
gcloud beta compute instances stop hercules --zone us-east1-c
```

* Step 06: Remover a imagem local do Container

```gcloud-shell
gcloud beta compute instances delete hercules --zone us-east1-c
```



## 4.4. Google APP Engine

### App Engine - Python Hello World

```gcloud-shell
git clone https://github.com/GoogleCloudPlatform/python-docs-samples
cd python-docs-samples/appengine/standard_python37/hello_world
cat main.py
virtualenv --python python3 ~/envs/hello_world
source ~/envs/hello_world/bin/activate
pip install -r requirements.txt
python main.py
gcloud app create
gcloud app deploy app.yaml --project eval-2019-06
gcloud app browse --project=eval-2019-06
```


# I - Referencias
* [Google Cloud Platform Tutorial | Google Cloud Platform Fundamentals | GCP Training | Edureka](https://www.youtube.com/watch?v=_Q0tRI5hMnc&t=230s)
https://github.com/GoogleCloudPlatform/jenkins-docker/blob/master/2/README.md#using-docker
