const express = require('express');
const { criarUsuario } = require('../services/userService'); 

const router = express.Router();

router.post('/', async (req, res) => {
  try {
    const { nome, senha, email, endereco } = req.body;

    if (!nome || !senha || !email || !endereco) {
      return res.status(400).json({ error: 'Todos os campos são obrigatórios.' });
    }

    const novoUsuario = await criarUsuario({ nome, senha, email, endereco });

    res.status(201).json(novoUsuario);
  } catch (error) {
    console.error('Erro ao criar usuário:', error);

    if (error.code === '23505') {
      res.status(400).json({ error: 'Email já está em uso.' });
    } else {
      res.status(500).json({ error: 'Erro interno do servidor.' });
    }
  }
});

module.exports = router;
