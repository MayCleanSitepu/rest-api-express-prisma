const express = require('express');
const { isAuthenticated } = require('../middlewares'); // Import isAuthenticated correctly
const { 
    getAllFaskes, 
    getFaskesById, 
    createFaskes, 
    updateFaskesById, 
    deleteFaskesById,

} = require('./faskes.services.js');

const router = express.Router();

// Faskes Routes
router.get('/', async (req, res) => {
    const faskes = await getAllFaskes();
    res.send(faskes);
});

router.get('/:id', async (req, res) => {
    const faskes = await getFaskesById(req.params.id);
    res.send(faskes);
});

router.post('/', isAuthenticated,  async (req, res) => { // Use checkRole correctly
    const newFaskes = await createFaskes(req.body);
    res.send(newFaskes);
});

router.put('/:id', isAuthenticated,  async (req, res) => { // Use checkRole correctly
    const updatedFaskes = await updateFaskesById(req.params.id, req.body);
    res.send(updatedFaskes);
});

router.delete('/:id', isAuthenticated,  async (req, res) => { // Use checkRole correctly
    await deleteFaskesById(req.params.id);
    res.send({ message: 'Faskes deleted successfully' });
});



module.exports = router;
