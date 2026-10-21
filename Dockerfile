# FROM node:6-stretch
FROM node:18.13.0

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

RUN npm update --legacy-peer-deps
RUN npm install --legacy-peer-deps
EXPOSE 3001
EXPOSE 9229
ENTRYPOINT ["npm", "start"]
