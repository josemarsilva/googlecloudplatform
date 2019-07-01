## googlecloudplatform
Google Cloud Platform

# 1. Introdução

O objetivo deste projeto é compilar os tutoriais mais interessantes do **GPC - Google Cloud Platform**.


# 2. Premissas

* [Uma conta ativa no Google Cloud Plataform - GCloud][https://cloud.google.com/]

# 3. Tutoriais

# 3.1. Browse nos Tutoriais

* [Browse Tutorials](https://cloud.google.com/community/tutorials/)

# 3.2. APP Engine 

* []()


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
