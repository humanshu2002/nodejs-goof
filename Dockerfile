# FROM node:6-stretch
FROM node:18.13.0-bullseye

# Pinned vulnerable OS packages for SCA remediation agent testing (Dockerfile RUN pins → dependency track).
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libcurl4=7.74.0-1.3+deb11u13 \
       curl=7.74.0-1.3+deb11u13 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

RUN npm update
RUN npm install
EXPOSE 3001
EXPOSE 9229
ENTRYPOINT ["npm", "start"]
