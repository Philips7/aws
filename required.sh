#!/bin/bash

#Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'

node_version=$(node -v)
echo -e "${YELLOW}Node.js version: $node_version${RESET}"

string1="v"
version="20.10.0"
required_version="$string1$version"

if [[ "$node_version" == "$required_version" ]]; then
  echo -e "${GREEN}Node.js version meets the requirement.${RESET}"
else
  echo -e "${RED}Node.js version does not meet the requirement. Please install Node.js version $required_version${RESET}"
  exit 1
fi

if [ -e "package.json" ]; then
  echo -e "${GREEN}package.json exists.${RESET}"
else
  echo -e "${RED}package.json does not exist.${RESET}"
  exit 1
fi

if [ -e ".nvmrc" ]; then
  echo -e "${GREEN}.nvmrc file exists.${RESET}"
else
  echo -e "${RED}.nvmrc file does not exist.${RESET}"
  exit 1
fi

if [ -d "src" ]; then
  echo -e "${GREEN}src folder exists.${RESET}"
else
  echo -e "${RED}src folder does not exist.${RESET}"
  exit 1
fi

if [ -f "src/main.tsx" ]; then
  echo -e "${GREEN}src/main.tsx file exists.${RESET}"
else
  echo -e "${RED}src/main.tsx file does not exist.${RESET}"
  exit 1
fi

if [ -d "locales" ]; then
  echo -e "${GREEN}locales folder exists.${RESET}"
else
  echo -e "${RED}locales folder does not exist.${RESET}"
  exit 1
fi

if [ -d "__tests__" ]; then
  echo -e "${GREEN}__tests__ folder exists.${RESET}"
else
  echo -e "${RED}__tests__ folder does not exist.${RESET}"
  exit 1
fi

bash preinstall.sh