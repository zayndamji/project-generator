// This is a template for a basic NodeJS Express application.

const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.sendFile('./html/index.html', { root: __dirname })
});

app.listen(3000, 'localhost', () => {
  console.log('Go to http://localhost:3000');
});