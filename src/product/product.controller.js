const express = require('express');

const prisma = require('../db');
const { getAllProducts, getProductById, createProduct, deleteProduct } = require('./product.service');

const router = express.Router();

router.get("/", async (req, res)=>{
    const products = await getAllProducts();
    
    res.send(products);
})

router.get("/:id", async (req, res)=>{

    try {
        const productId = parseInt(req.params.id);
        const product = await getProductById(productId);
    
        res.send(product); 
    } catch (err) {
        res.status(404).send(err.message)
    }

});

router.post("/", async (req, res)=>{ 

    try {        
        const newProductData = req.body;
        
        const product = await createProduct(newProductData);
    
        res.status(201).send({
            data: product,
            message:"create product success"});
    } catch (error) {
        res.status(400).send(error.message)
    }
    
})

router.delete("/:id", async (req, res)=>{
    try {
        const productId = req.params.id;
    
        await deleteProduct(parseInt(productId));
    } catch (error) {
        res.status(400).send(error.message)
    }
});

router.put("/:id", async (req, res)=>{

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

router.patch("/:id", async (req, res)=>{
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

module.exports = router;