version: '3'
services:
  nginx:
    image: nginx:1.11.8-alpine
    ports:
      - "8081:80"
    volumes:
      - my_test_volume:/usr/share/appis



