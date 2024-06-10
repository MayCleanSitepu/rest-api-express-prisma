const express = require('express');

const { 
    getAllProducts, 
    getProductById, 
    createProduct, 
    deleteProduct, 
    editProductById } = require('./product.services');
const { parse } = require('dotenv');

const router = express.Router();

router.get("/", async (req, res)=>{
    const products = await getAllProducts();
    
    res.send(products);
})

router.get("/:id", async (req, res)=>{

    try {
        const productId = parseInt(req.params.id);
        const product = await getProductById(parseInt( productId));
    
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


    const product = await editProductById(parseInt(productId), productData);
});

router.patch("/:id", async (req, res)=>{
    try {
        const productId = req.params.id;
        const productData = req.body;
        const product = await editProductById(parseInt(productId), productData);
    
        res.send({
            data: product,
            message: "edit product success"
        })
    } catch (error) {
        res.status(400).send(error.message)
    }
});

module.exports = router;