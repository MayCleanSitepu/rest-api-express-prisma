const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// Faskes Service Functions
async function getAllFaskes() {
    return await prisma.faskes.findMany();
}

async function getFaskesById(id) {
    return await prisma.faskes.findUnique({ 
        where: { id: Number(id) } 
    });
}

async function createFaskes(data) {
    const createdFaskes =  await prisma.faskes.create({ data });
    return {
        data: createdFaskes,
        message: 'data faskes berhasil ditambahkan'
    }
}

async function updateFaskesById(id, data) {
    return await prisma.faskes.update({
        where: { id: Number(id) },
        data
    });
}

async function deleteFaskesById(id) {
    return await prisma.faskes.delete({ where: { id: Number(id) } });
}



module.exports = { 
    getAllFaskes, 
    getFaskesById, 
    createFaskes, 
    updateFaskesById, 
    deleteFaskesById,
};
