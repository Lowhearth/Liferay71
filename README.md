
HOW TO START YOUR LIFERAY 7.1 AT LOCALHOST:9090

Create a folder with the Dockerfile from this repository.
Execute the following commands inside the folder:
  docker build . -t liferay71
  docker run -d --name liferay71container -p 9090:8080 liferay71
