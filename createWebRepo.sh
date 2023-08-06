#! /bin/bash

function createWebDirs() {
  local PROJECT_NAME=$1
  mkdir -p "$PROJECT_NAME/css" "$PROJECT_NAME/js" "$PROJECT_NAME/images"
}

function createIndexHTML() {
  local PROJECT_NAME=$1
  echo '<!DOCTYPE html>
  <html>
  <head>
  <title>'"$PROJECT_NAME"'</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <script src="js/script.js"></script>
  </head>
  <body>
  <h1>Hello, Web World!</h1>
  </body>
  </html>' > "$PROJECT_NAME/index.html"
}

function createCSS() {
  local PROJECT_NAME=$1
  echo '* {
  margin: 0;
  padding: 0;
  box-sizing: borer-box;
  font-size: 16px;
  font-family: Arial, Helvetica, sans-serif;' > "$PROJECT_NAME/css/style.css"
}

function createJS() {
  local PROJECT_NAME=$1
  echo 'document.addEventListener("DOMContentLoaded", function() {
  console.log("Hello from script.js!");
});' > "$PROJECT_NAME/js/script.js"
}

function createWebDevFiles() {
  local PROJECT_NAME=$1
  touch "$PROJECT_NAME/README.md"
}

function createWebDirStructure() {
  local PROJECT_NAME=$1
  mkdir "$PROJECT_NAME"
  createWebDirs "$PROJECT_NAME"
  createIndexHTML "$PROJECT_NAME"
  createCSS "$PROJECT_NAME"
  createJS "$PROJECT_NAME"
  createWebDevFiles "$PROJECT_NAME"
}

function main() {
  createWebDirStructure "$1"
}

main "$1"

