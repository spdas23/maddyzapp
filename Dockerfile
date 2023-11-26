FROM centos:7
RUN yum update -y && yum install epel-release -y
RUN yum install nginx -y  
COPY ./index.html /var/www/html/index.html
Expose 80
CMD ["nginx", "-g", "daemon off;"]


