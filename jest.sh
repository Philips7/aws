#!/bin/bash

yarn add jest @testing-library/react @babel/preset-react @testing-library/jest-dom

# Check if installation was successful
if [ $? -eq 0 ]; then
  echo -e "${GREEN}Install was successful.${NOCOLOR}"
else
  echo -e "${RED} Error during installation${NOCOLOR}".
fi

yarn add @babel/preset-env @babel/preset-typescript @types/jest --dev

# Check if installation was successful
if [ $? -eq 0 ]; then
  echo -e "${GREEN}Install was successful.${NOCOLOR}"
else
  echo -e "${RED} Error during installation${NOCOLOR}".
fi

