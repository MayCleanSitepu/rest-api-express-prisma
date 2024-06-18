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



// const productController = require("./product/product.controller"); 

// app.use('/products', productController)

const faskesController = require("./faskes/faskes.controller");
app.use('/faskes', faskesController);

const provinsiControler = require("./provinsi/provinsi.controller");
app.use('/provinsi', provinsiControler);

app.listen(PORT, () => {
    console.log("Running in port " + PORT);
});
