-- Tabela Usuário
CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    endereco TEXT NOT NULL
);

-- Tabela Pedido
CREATE TABLE Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    valorProdutos DECIMAL(10, 2) NOT NULL,
    valorFrete DECIMAL(10, 2) NOT NULL,
    valorTotal DECIMAL(10, 2) NOT NULL,
    data DATETIME NOT NULL,
    idFormapgto INT NOT NULL,
    endereco_entrega TEXT NOT NULL,
    status ENUM('Pendente', 'Pago', 'Enviado', 'Concluído', 'Cancelado') NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(id),
    FOREIGN KEY (idFormapgto) REFERENCES FormaPagamento(id)
);

-- Tabela Produto
CREATE TABLE Produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    valorUnitario DECIMAL(10, 2) NOT NULL,
    pesoProduto DECIMAL(10, 2) NOT NULL,
    idTipo INT NOT NULL,
    FOREIGN KEY (idTipo) REFERENCES TipoProduto(id)
);

-- Tabela pedido_produtos
CREATE TABLE pedido_produtos (
    idPedido INT NOT NULL,
    idProduto INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (idPedido, idProduto),
    FOREIGN KEY (idPedido) REFERENCES Pedido(id),
    FOREIGN KEY (idProduto) REFERENCES Produto(id)
);

-- Tabela FormaPagamento
CREATE TABLE FormaPagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

-- Tabela TipoProduto
CREATE TABLE TipoProduto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);
