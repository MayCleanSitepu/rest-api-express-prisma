const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// Provinsi Service Functions
async function getAllProvinsi() {
    return await prisma.provinsi.findMany();
}

async function getProvinsiById(id) {
    return await prisma.provinsi.findUnique({ where: { id: Number(id) } });
}

async function createProvinsi(data) {
    return await prisma.provinsi.create({ data });
}

async function updateProvinsiById(id, data) {
    return await prisma.provinsi.update({
        where: { id: Number(id) },
        data
    });
}

async function deleteProvinsiById(id) {
    return await prisma.provinsi.delete({ where: { id: Number(id) } });
}



module.exports = { 
    getAllProvinsi, 
    getProvinsiById, 
    createProvinsi, 
    updateProvinsiById, 
    deleteProvinsiById 
};
