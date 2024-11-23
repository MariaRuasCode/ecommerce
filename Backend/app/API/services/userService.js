const pool = require('./../db')

const criarUsuario = async (userData) => {
    const { nome, senha, email, endereco} = userData;
    const query = `
    INSERT INTO Usuario (nome, senha, email, endereco)
    VALUES ($1, $2, $3, $4) RETURNING *;
  `;

  const values = [nome, senha, email, endereco];
  const result = await pool.query(query, values);
  
  return result.rows[0];
};


module.exports = {
    criarUsuario,
  };