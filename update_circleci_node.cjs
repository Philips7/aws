const fs = require('fs');

const reset = '\x1b[0m';
const green = '\x1b[32m';
const red = '\x1b[0m';

const configPath = '.circleci/config.yml';
const nvmrcPath = '.nvmrc';

fs.readFile(nvmrcPath, 'utf-8', (err, data) => {
    if (err) {
        console.error(`${red}Can not read a file ${nvmrcPath}: ${err.message}${reset}`);
        return;
    }

    // Node version from .nvmrc file
    const newNodeVersion = data.trim();

    // Read config.yml file
    fs.readFile(configPath, 'utf-8', (err, data) => {
        if (err) {
            console.error(`${red} Can not read file ${configPath}: ${err.message}${reset}`);
            return;
        }

        // Find and replace line starting with "- image: cimg/node:"
        const updatedConfig = data.replace(
            /^(\s*- image: cimg\/node:).*$/gm,
            `$1${newNodeVersion}`
        );

        // Save updated config.yml file
        fs.writeFile(configPath, updatedConfig, 'utf-8', (err) => {
            if (err) {
                console.error(`${red}Can not save file ${configPath}: ${err.message}${reset}`);
                return;
            }

            console.log(`${green}Node.js version updated in ${configPath} file to ${newNodeVersion}.${reset}`);
        });
    });
});