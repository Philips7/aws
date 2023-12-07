#!/bin/bash

set -e

node_version=$(node -v)
echo "Node.js version: $node_version"

string1="v"
version="20.10.0"
required_version="$string1$version"

echo $node_version
echo $required_version

if [[ "$node_version" == "$required_version" ]]; then
  echo "Node.js version meets the requirement."
else
  echo "Node.js version does not meet the requirement."
  exit 1
fi

bash ./install_jest_dependencies.sh
bash ./install_i18n_dependencies.sh

# Translations
node ./move_locales.cjs
node ./add_locales_import.cjs

# Jest
node ./move_tests.cjs

# Update package.json
node ./update_package_json.cjs

# Update CircleCi node version
node ./update_circleci_node.cjs

