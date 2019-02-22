const express = require('express');
const app = express();

app.get('/', (req, res) => {
    // Generate delay between 0.5 and 1 second.
    const delay = Math.random() * (1000 - 500) + 500;
    setTimeout(() => {
        res.send(`Hello World! Delay: ${delay}ms`);
    }, delay);
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, (err) => {
    if (err) throw err;
    console.log('App started!');
})