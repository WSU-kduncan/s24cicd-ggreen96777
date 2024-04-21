#!/bin/bash

docker pull ggreen96777/ci-project-green:latest

docker stop exciting_ardinghelli

docker rm exciting_ardenhelli

docker run -d -p 80:80 --name exciting_ardenhelli ggreen96777/ci-project-green:latest
