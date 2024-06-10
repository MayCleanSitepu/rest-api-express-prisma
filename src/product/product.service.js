const prisma = require('../db');    

const getAllProducts = async () => {
    const products = await prisma.product.findMany();

    return products;
};

const getProductById = async (id) => {
    if (typeof id !== 'number') {
        throw Error('Invalid ID')
    }

    const product = await prisma.product.findUnique({
        where: {
            id,
        }
    });

    if (!product) {
        throw Error('product not found')
    }

    return product
}

const createProduct = async (newProductData) => {
    const product = await prisma.product.create({
        data:{ 
            name: newProductData.name,
            price: newProductData.price,
            description: newProductData.description,
            image: newProductData.image,
     },
    });

    return product;
}

const deleteProduct = async (id) => {

    await getProductById(id);

    await prisma.product.delete({
        where: {
            id: parseInt(productId),
        },
    });
}

const patchProduct = async (id, productData) => {
    
}

module.exports = { 
    getAllProducts, 
    getProductById,
    createProduct,
    deleteProduct,

};