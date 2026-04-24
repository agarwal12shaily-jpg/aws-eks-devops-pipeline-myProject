const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('DevOps CI/CD Pipeline Working!');
});

app.listen(3000);
