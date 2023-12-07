#!/bin/bash

NOCOLOR='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# Install dev packages
yarn add jest @testing-library/react ts-jest @types/jest ts-node @testing-library/jest-dom identity-obj-proxy jest-transform-stub --dev

# Check if installation was successful
if [ $? -eq 0 ]; then
  echo -e "${GREEN}Install was successful.${NOCOLOR}"
else
  echo -e "${RED} Error during installation${NOCOLOR}".
fi

# Install packages
yarn add jest-environment-jsdom

# Check if installation was successful
if [ $? -eq 0 ]; then
  echo -e "${GREEN}Install was successful.${NOCOLOR}"
else
  echo -e "${RED} Error during installation${NOCOLOR}".
fi


# Move test file to src
source_folder="__tests__/"
target_folder="src/"

if [ -d "$source_folder" ]; then
  mv "$source_folder" "$target_folder"
  echo -e "${GREEN}Test tile moved successfully to $target_folder.${NOCOLOR}"
else
  echo -e "${RED}Source folder does not exist.${NOCOLOR}"
fi

# Add scripts:
# "test": "jest"
# "test:ci": "yarn test --ci --coverage=true --colors"
