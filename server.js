// server.js - Express server to serve static files and handle routes. 
const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 8084;

// Serve static files from the 'public' directory; dont technically need the below routes if using a frontend framework that handles routing. Could run the pages below using the .html files in public folder directly.
app.use(express.static('public'));

// Routes for different pages of the portfolio
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get('/contact', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'contact.html'));
});

app.get('/projects', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'projects.html'));
});

app.get('/about', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'about.html'));
});

app.get('/gallery', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'gallery.html'));
});

// Start the server 
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});