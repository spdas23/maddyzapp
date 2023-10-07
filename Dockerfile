FROM centos:7
RUN yum update -y && yum install epel-release -y
RUN yum install nginx -y  
COPY ./index.html /usr/share/nginx/html/index.html
Expose 8090
CMD ["nginx", "-g", "daemon off;"]


