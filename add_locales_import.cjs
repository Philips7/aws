const fs = require('fs');

const reset = '\x1b[0m';
const green = '\x1b[32m';
const red = '\x1b[0m';

// Path to main.tsx file
const filePath = 'src/main.tsx';

// Line to add
const lineToAdd = 'import "./locales/i18n/config";';

fs.readFile(filePath, 'utf-8', (err, data) => {
    if (err) {
        console.log(`${red}Failed to read a file ${filePath}: ${err.message}`);
        return;
    }

    // Add the line at the beginning of the file
    const updatedData = `${lineToAdd}\n${data}`;

    // Save the updated file
    fs.writeFile(filePath, updatedData, 'utf-8', (err) => {
        if (err) {
            console.log(`${red}Failed to save file ${filePath}: ${err.message}${reset}`);
            return;
        }

        console.log(`${green}Added import tests line at the beginning of the file ${filePath}.${reset}`);
    });
});