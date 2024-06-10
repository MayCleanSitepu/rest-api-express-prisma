//kalau ganti ORM bisa ganti aja disini gausa utak atik service atau controller

const prisma = require('../db');

const findProducts = async () => {
    const products = await prisma.product.findMany();

    return products;
}

const findProductById = async (id) => {
    const product = await prisma.product.findUnique({
        where: {
            id,
        }
    });
    return product
}

const insertProduct = async (newProductData) => {
    const product = await prisma.product.create({
        data: {
            name: newProductData.name,
            price: newProductData.price,
            description: newProductData.description,
            image: newProductData.image,
        },
    });

    return product;
}

const findProductByName = async (name) => {
    const product = await prisma.product.findFirst({
        where: {
            name,
        }
    });
    return product
}

const deleteProduct = async () => {
    await prisma.product.delete();
}

const editProduct = async (id, productData) => {
    const product = await prisma.product.update({
        where: {
            id: parseInt(id),
        },
        data: {
            name: productData.name,
            price: productData.price,
            description: productData.description,
            image: productData.image,
        },
    });

    return product;
}



module.exports = { 
    findProducts,
    findProductById,
    insertProduct,
    findProductByName,
    deleteProduct,
    editProduct,
 };