#! /bin/zsh

function createChildDirs() {
  local PROJECT_NAME=$1
  mkdir -p "$PROJECT_NAME/src" "$PROJECT_NAME/test"
}

function createMain() {
  local PROJECT_NAME=$1
  echo 'const main = () => console.log("hello world!!!");' > "$PROJECT_NAME/main.js"
}

function createDevFiles() {
  local PROJECT_NAME=$1
  touch "$PROJECT_NAME/TODO"
  touch "$PROJECT_NAME/.eslintrc.js"
  touch "$PROJECT_NAME/.eslintignore"
  touch "$PROJECT_NAME/.gitignore"
  touch "$PROJECT_NAME/README.md"
}

function writeEslintFiles() {
  local PROJECT_NAME=$1
  echo "module.exports = {
  env: {
  node: true,
  browser: true,
  es2021: true,
},
extends: 'eslint:recommended',
parserOptions: {
ecmaVersion: 'latest',
sourceType: 'module',
},
};" > "$PROJECT_NAME/.eslintrc.js"
}

function writeGitIgnore() {
  local PROJECT_NAME=$1
  echo 'node_modules' > "$PROJECT_NAME/.gitignore"
}

function writeSrcAndTestFiles() {
  local PROJECT_NAME=$1
  touch $PROJECT_NAME/src/$PROJECT_NAME.js
  touch $PROJECT_NAME/test/$PROJECT_NAME-test.js
}

function writeDevFiles() {
  local PROJECT_NAME=$1
  writeEslintFiles "$PROJECT_NAME"
  writeGitIgnore "$PROJECT_NAME"
}

function createDirStructure() {
  local PROJECT_NAME=$1
  mkdir "$PROJECT_NAME"
  createChildDirs "$PROJECT_NAME"
  writeSrcAndTestFiles "$PROJECT_NAME"
  createMain "$PROJECT_NAME"
  createDevFiles "$PROJECT_NAME"
  writeDevFiles "$PROJECT_NAME"
}

function main() {
  createDirStructure "$1"
}

main "$1"

