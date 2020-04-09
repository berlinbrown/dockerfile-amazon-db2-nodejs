# Build stage - 4.9.2020
FROM amazonlinux:2.0.20200304.0 as build-stage
WORKDIR /app
COPY app/ ./

# From IBM documentation:
RUN yum install -y add make gcc gcc-c++
RUN yum install -y kernel-devel
RUN yum install -y openssl-devel bzip2-devel
RUN yum install -y python2
RUN yum install -y wget
RUN yum install -y curl

RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs
#RUN npm install bcrypt
#RUN npm install --unsafe-perm ibm_db
RUN npm install --unsafe-perm 

#----------------------------
# Production stage
#----------------------------
FROM amazonlinux:2.0.20200304.0 as production-stage
#RUN useradd -ms /bin/bash node
#USER node
WORKDIR /app
#COPY --from=build-stage --chown=node:node /app .
COPY --from=build-stage /app .

# From IBM documentation:
RUN yum install -y openssl-devel bzip2-devel
RUN yum install -y python2
RUN yum install -y wget
RUN yum install -y curl

RUN yum install -y pam.x86_64
RUN yum install -y pam-devel.x86_64

RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs

#USER node

CMD [ "node", "index.js" ]
