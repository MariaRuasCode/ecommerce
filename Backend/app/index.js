const express = require('express');
const app = express();
const port = 8080;
app.use(express.json());




const usuarioRoutes = require('./API/endpoints/UserRotas');


app.use('/usuarios', usuarioRoutes);

app.get('/', (req, res) => res.send('ALOU!!!'));

app.listen(port, () => console.log(`App running on http://localhost:${port}`));


/**Usuario
 *  1. Registro
 *  2. Login
 *  3. Deletar
 * 
 * 4. get users
 * 
  */

/**Produto 
 *  1. Get todos os produtos
 *  2. Deletar produto
 *  3. Adicionar Produto
 */

/** Pedido
 *  1. Criar um pedido
 *  2. Excluir Pedido
 *  3. Get Pedido
 *  4. 
 */