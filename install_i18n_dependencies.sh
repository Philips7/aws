#!/bin/bash

# Install i18n packages
yarn add i18next react-i18next i18next-parser i18next-browser-languagedetector i18next-http-backend

# Check if installation was successful
if [ $? -eq 0 ]; then
  echo -e "${GREEN}Install was successful.${NOCOLOR}"
else
  echo -e "${RED} Error during installation${NOCOLOR}".
fi
