-- Table: Usuario
CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    senha TEXT NOT NULL, -- Consider hashing passwords
    email VARCHAR(150) UNIQUE NOT NULL,
    endereco TEXT
);

-- Table: FormaPagamento
CREATE TABLE FormaPagamento (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

-- Table: TipoProduto
CREATE TABLE TipoProduto (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

-- Table: Produto
CREATE TABLE Produto (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    valor_unitario NUMERIC(10, 2) NOT NULL,
    peso_produto NUMERIC(10, 2),
    id_tipo INTEGER REFERENCES TipoProduto(id)
);

-- Table: Pedido
CREATE TABLE Pedido (
    id SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES Usuario(id),
    valor_produtos NUMERIC(10, 2) NOT NULL,
    valor_frete NUMERIC(10, 2),
    valor_total NUMERIC(10, 2) NOT NULL,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_formapgto INTEGER REFERENCES FormaPagamento(id),
    endereco_entrega TEXT NOT NULL,
    status VARCHAR(50) NOT NULL
);

-- Table: Pedido_Produtos
CREATE TABLE Pedido_Produtos (
    id_pedido INTEGER REFERENCES Pedido(id),
    id_produto INTEGER REFERENCES Produto(id),
    quantidade INTEGER NOT NULL,
    PRIMARY KEY (id_pedido, id_produto)
);
