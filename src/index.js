const express = require('express');
const dotenv = require('dotenv');
const auth = require('./auth/auth.routes');

const app = express();

app.use(express.json());
app.use('/auth', auth);
dotenv.config();

const PORT = process.env.PORT;



app.get("/api", (req, res)=>{
    res.send("Hello guy");
})



const productController = require("./product/product.controller"); 

app.use('/products', productController)


app.listen(PORT, () => {
    console.log("Running in port " + PORT);
});
