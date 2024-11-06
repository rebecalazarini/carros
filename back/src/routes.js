const express = require('express')
const router = express.Router();

const clientes = require('./controllers/clientes')
const telefone = require('./controllers/telefone')
const carros = require('./controllers/carros')

const teste = (req, res) => {
    res.json("Api respondendo");
}


router.get('/', teste);
router.post('/clientes', clientes.create);
router.get('/clientes', clientes.read);
router.put('/clientes/:id', clientes.update);
router.delete('/clientes/:id', clientes.deletar);

router.get('/', teste);
router.post('/telefone', telefone.create);
router.get('/telefone', telefone.read);
router.put('/telefone/:id', telefone.update);
router.delete('/telefone/:id', telefone.deletar);

router.post('/carros', carros.create);
router.get('/carros', carros.read);
router.put('/carros/:id', carros.update);
router.delete('/carros/:id', carros.deletar);

module.exports = router;