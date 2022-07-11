FROM ubuntu AS builder
RUN apt-get update
RUN apt-get install git -y
RUN git clone https://github.com/jerasioren/docker-test.git
WORKDIR docker-test
RUN git checkout -b Vivek
RUN echo "<html><body><h1>Hello World</h1></body></html>">index.html

FROM tomcat
#create a folder root
#copy index.html
COPY --from=builder docker-test/index.html /usr/local/tomcat/webapps/ROOT/
#Expose tomcat port
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]


