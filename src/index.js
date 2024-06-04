const express = require('express');
const dotenv = require('dotenv');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();
const app = express();

dotenv.config();

const PORT = process.env.PORT;

app.use(express.json());


app.get("/api", (req, res)=>{
    res.send("Hello guy");
})

app.get("/api/products", async (req, res)=>{
    const products = await prisma.product.findMany();

    res.send(products);
})

app.post("/api/products", async (req, res)=>{
    const newProductData = req.body;

     const product = await prisma.product.create({
        data:{ 
            name: newProductData.name,
            price: newProductData.price,
            description: newProductData.description,
            image: newProductData.image,
     },
    });

    res.status(201).send({
        data: product,
        message:"create product success"});
})

app.delete("/api/products/:id", async (req, res)=>{
    const productId = req.params.id;

    await prisma.product.delete({
        where: {
            id: parseInt(productId),
        }
    })
})

app.put("/api/products/:id", async (req, res)=>{

    const productId = req.params.id;
    const productData = req.body;
    
    if(!
        (productData.image && 
            productData.description && 
            productData.price && 
            productData.name)
        )
        {
        return res.status(400).send("some field is missing")
    }


    const product = await prisma.product.update({
        where: {
            id: parseInt(productId),
        },
        data: {
            name: productData.name,
            price: productData.price,
            description: productData.description,
            image: productData.image,
        },
    });

    res.send({
        data: product,
        message: "update product success"
    
    })
});

app.patch("/api/products/:id", async (req, res)=>{
    const productId = req.params.id;
    const productData = req.body;

    const product = await prisma.product.update({
        where: {
            id: parseInt(productId),
        },
        data: {
            name: productData.name,
            price: productData.price,
            description: productData.description,
            image: productData.image,
        },
    });

    res.send({
        data: product,
        message: "edit product success"
    
    })
});



app.listen(PORT, () => {
    console.log("Running in port " + PORT);
})
