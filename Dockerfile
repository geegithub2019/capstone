FROM python:3.7.3-stretch

# Custome index page
COPY ./blue/index.html /usr/share/nginx/html
