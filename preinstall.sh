#!/bin/bash

NOCOLOR='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# Install i18n packages
yarn add i18next react-i18next i18next-parser i18next-browser-languagedetector i18next-http-backend

# Check if installation was successful
if [ $? -eq 0 ]; then
  echo -e "${GREEN}Install was successful.${NOCOLOR}"
else
  echo -e "${RED} Error during installation${NOCOLOR}".
fi

# Move locales folder to src
source_folder="locales/"
target_folder="src/"

if [ -d "$source_folder" ]; then
  mv "$source_folder" "$target_folder"
  echo -e "${GREEN}Locales folder moved successfully to $target_folder.${NOCOLOR}"
else
  echo -e "${RED}Source folder does not exist.${NOCOLOR}"
fi

# Add scripts:
# "type_check": "tsc",
# "extract": "i18next"

# Import locales to src/main.tsx
# import "./locales/i18n/config";