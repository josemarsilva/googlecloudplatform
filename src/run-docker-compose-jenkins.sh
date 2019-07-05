docker run \
  --name some-jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -d \
  launcher.gcr.io/google/jenkins2