#!/bin/bash

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
