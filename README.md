sudo docker build -t tomcat:1 .
sudo docker run -it --name=servlet -p 8080:8080 tomcat:1
