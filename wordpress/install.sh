#!/bin/bash
docker login
docker-compose up -d
# open localhost:8000

# Eliminar tudo
# docker-compose down --rmi all