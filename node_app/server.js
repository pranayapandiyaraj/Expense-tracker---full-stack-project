const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 3000;
const LOG_FILE = path.join(__dirname, 'requests.log');
const STATIC_FILE = path.join(__dirname, 'index.html');

const server = http.createServer((req, res) => {
    // 1. Log every incoming request to a file (Ex 9.1)
    const logEntry = `${new Date().toISOString()} - ${req.method} ${req.url}\n`;
    fs.appendFile(LOG_FILE, logEntry, (err) => {
        if (err) console.error("Failed to write to log file");
    });

    // 2. Serve a static HTML page using built-in HTTP module (Ex 9.2)
    if (req.url === '/' || req.url === '/index.html') {
        fs.readFile(STATIC_FILE, (err, content) => {
            if (err) {
                res.writeHead(500, { 'Content-Type': 'text/plain' });
                res.end("Internal Server Error");
            } else {
                res.writeHead(200, { 'Content-Type': 'text/html' });
                res.end(content, 'utf-8');
            }
        });
    } else {
        res.writeHead(404, { 'Content-Type': 'text/plain' });
        res.end("404 Not Found");
    }
});

server.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
    console.log(`Logging requests to ${LOG_FILE}`);
});
