const express = require('express');
const router = express.Router();
const { isAuthenticated } = require('../middlewares'); // Import isAuthenticated correctly
const { 
    getAllProvinsi,
    getProvinsiById,
    createProvinsi,
    updateProvinsiById,
    deleteProvinsiById,
} = require('./provinsi.services.js');

// Provinsi Routes
router.get('/', async (req, res) => { // Added req parameter
    const provinsi = await getAllProvinsi();
    res.send(provinsi);
});

router.get('/:id', async (req, res) => {
    const provinsi = await getProvinsiById(req.params.id);
    res.send(provinsi);
});

router.post('/', isAuthenticated, async (req, res) => {
    const newProvinsi = await createProvinsi(req.body);
    res.send(newProvinsi);
});

router.put('/:id', isAuthenticated, async (req, res) => {
    const updatedProvinsi = await updateProvinsiById(req.params.id, req.body);
    res.send(updatedProvinsi);
});

router.delete('/:id', isAuthenticated, async (req, res) => {
    await deleteProvinsiById(req.params.id);
    res.send({ message: 'Provinsi deleted successfully' });
});

module.exports = router;