#!/bin/sh

# The folder have to be empty
rm -f ${PWD}/app/.gitkeep

# Create new node container and create react app into the mounted app folder
docker container run -v ${PWD}/app:/app --name create-react-app node:12-alpine sh -c "npx create-react-app app"

# Set the proper user owner for app files
USER=$(whoami)
sudo chown -R $USER ${PWD}/app

# Move all necessary files into the root folder
mv ${PWD}/app/node_modules .
mv ${PWD}/app/public .
mv ${PWD}/app/src .
mv ${PWD}/app/package.json .
mv ${PWD}/app/yarn.lock .
mv {$PWD}/app/.gitignore .
mv {$PWD}/app/README.md .

# Remove create-react-app container
docker container rm -f create-react-app

# Remove app folder
rm -rf ${PWD}/app