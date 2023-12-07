const fs = require('fs');
const path = require('path');

const reset = '\x1b[0m';
const green = '\x1b[32m';
const red = '\x1b[31m';

// Paths to folders
const sourcePath = '__tests__';
const destinationPath = 'src/__tests__';

// Create the destination folder if it doesn't exist
if (!fs.existsSync(destinationPath)) {
    fs.mkdirSync(destinationPath, { recursive: true });
}

try {
    fs.readdirSync(sourcePath).forEach((file) => {
        const sourceFile = path.join(sourcePath, file);
        const destinationFile = path.join(destinationPath, file);

        fs.renameSync(sourceFile, destinationFile);
    });

    fs.rmdirSync(sourcePath);

    console.log(`${green}Moved the ${sourcePath} folder to ${destinationPath}.${reset}`);
} catch (error) {
    console.log(`${red}Can not move tests folder. Please do it manually. Copy tests folder and place it inside src folder${reset}`);
}
