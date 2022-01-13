const express = require('express');
const router = express.Router();

const managerController = require('../controllers/managerController')

// GET /manager
router.get('/', managerController.default);

// GET /manager/dashboard
router.get('/dashboard', managerController.dashboard);

// GET /manager/people
router.get('/people', managerController.people);

// GET /manager/people/:id
router.get('/people/:id', managerController.people);

// GET manager/necessities
router.get('/necessities', managerController.necessities);

// GET /manager/packages
router.get('/packages', managerController.packages);

module.exports = router;