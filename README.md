# dockerfile-amazon-db2-nodejs
Dockerfile Configuration Usage with IBM DB2 and NodeJS

## Overview

dockerfile-amazon-db2-nodejs

This project is a simple nodejs/express project to interact with 
node, express but also includes use of the db2 driver.

Amazon linux based docker image (rhel)

# Running

    docker build -t test .
    docker stop 5881c1d94e58
    docker run -p 3000:3000  test

