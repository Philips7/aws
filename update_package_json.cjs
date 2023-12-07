/**
 This script is setting project name, Node.js version in engines and adds scripts in package.json file.
 */

const fs = require('fs');
const path = require('path');

const reset = '\x1b[0m';
const green = '\x1b[32m';
const red = '\x1b[0m';

const { execSync } = require('child_process');

// Git project name
const gitCommandOutput = execSync('git rev-parse --show-toplevel', { encoding: 'utf-8' });
const projectName = gitCommandOutput.trim().split('/').pop();

// Path to .nvmrc file
const nvmrcPath = path.join(__dirname, '.nvmrc');

// Path to package.json file
const packageJsonPath = path.join(__dirname, 'package.json');

// Read Node.js version from .nvmrc file
const nodeVersion = fs.readFileSync(nvmrcPath, 'utf-8').trim();

// Read package.json file
const packageJson = require(packageJsonPath);

// Update "name"
packageJson.name = projectName

// Update "engines" section
packageJson.engines = {
    node: nodeVersion,
};

// Update "scripts" section
packageJson.scripts = {
    ...packageJson.scripts,
    "test": "jest",
    "test:ci": "yarn test --ci --coverage=true --colors",
    "type_check": "tsc",
    "extract": "i18next"
};


// Save updated package.json file
try {
    fs.writeFileSync(packageJsonPath, JSON.stringify(packageJson, null, 2));
    console.log(`${green}Node version has been updated in the "engines" section to ${nodeVersion}.${reset}`);
    console.log(`${green}New scripts were added: test, test:ci, type_check, extract.${reset}`);
    console.log(`${green}Project name changed in package.json to: ${projectName}`);
} catch (error) {
    console.log(`${red}Can not save file ${packageJsonPath}: ${error.message}${reset}`)
}


