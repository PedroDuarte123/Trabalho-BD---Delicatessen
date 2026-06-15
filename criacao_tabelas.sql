-- TABELAS INDEPENDENTES (FORTES)

CREATE TABLE Cliente (
    Telefone VARCHAR(20),
    Nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (Telefone)
);

CREATE TABLE Origem (
    Regiao VARCHAR(100),
    Pais VARCHAR(100),
    Cidade VARCHAR(100),
    PRIMARY KEY (Regiao, Pais, Cidade)
);

CREATE TABLE Acessorios (
    Nome VARCHAR(100),
    TipoPreparo VARCHAR(100) NOT NULL,
    PRIMARY KEY (Nome)
);


-- TABELAS QUE DEPENDEM APENAS DAS ENTIDADES FORTES

CREATE TABLE Pedido ( 
    Data DATE,
    TelefoneCliente VARCHAR(20),
    PRIMARY KEY (Data, TelefoneCliente),
    FOREIGN KEY (TelefoneCliente)
        REFERENCES Cliente(Telefone)
);

CREATE TABLE Encomenda (
    Data DATE,
    TelefoneCliente VARCHAR(20),
    Status VARCHAR(50) NOT NULL,
    PRIMARY KEY (Data, TelefoneCliente),
    FOREIGN KEY (TelefoneCliente)
        REFERENCES Cliente(Telefone)
);

CREATE TABLE Produto (
    Descricao VARCHAR(255),
    RegiaoOrigem VARCHAR(100),
    PaisOrigem VARCHAR(100),
    CidadeOrigem VARCHAR(100),
    PRIMARY KEY (Descricao, RegiaoOrigem, PaisOrigem, CidadeOrigem),
    FOREIGN KEY (RegiaoOrigem, PaisOrigem, CidadeOrigem) 
        REFERENCES Origem (Regiao, Pais, Cidade)
);

CREATE TABLE ProdutoInformacao (
    Descricao VARCHAR(255),
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    PRIMARY KEY (Descricao),
    FOREIGN KEY (Descricao)
        REFERENCES Produto (Descricao)
);

-- ESPECIALIZAÇÕES DE PRODUTO (HERANÇA/SUBTIPOS)

CREATE TABLE Queijos (
    DescricaoProduto VARCHAR(255),
    RegiaoProduto VARCHAR(100),
    PaisProduto VARCHAR(100),
    CidadeProduto VARCHAR(100),
    PRIMARY KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto),
    FOREIGN KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto)
        REFERENCES Produto(Descricao, RegiaoOrigem, PaisOrigem, CidadeOrigem)
);

CREATE TABLE Bebida_Alcoolica (
    DescricaoProduto VARCHAR(255),
    RegiaoProduto VARCHAR(100),
    PaisProduto VARCHAR(100),
    CidadeProduto VARCHAR(100),
    TeorAlcoolico NUMERIC(4,2) NOT NULL,
    PRIMARY KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto),
    FOREIGN KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto) 
        REFERENCES Produto(Descricao, RegiaoOrigem, PaisOrigem, CidadeOrigem)
);

CREATE TABLE Chas_e_Cafes (
    DescricaoProduto VARCHAR(255),
    RegiaoProduto VARCHAR(100),
    PaisProduto VARCHAR(100),
    CidadeProduto VARCHAR(100),
    PRIMARY KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto),
    FOREIGN KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto) 
        REFERENCES Produto(Descricao, RegiaoOrigem, PaisOrigem, CidadeOrigem)
);

-- ENTIDADES FRACAS E RELACIONAMENTOS N:M

CREATE TABLE Item_Estoque (
    DataValidade DATE,
    DescricaoProduto VARCHAR(255),
    RegiaoProduto VARCHAR(100),
    PaisProduto VARCHAR(100),
    CidadeProduto VARCHAR(100),
    Quantidade INT NOT NULL,
    PRIMARY KEY (DataValidade, DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto),
    FOREIGN KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto) 
        REFERENCES Produto(Descricao, RegiaoOrigem, PaisOrigem, CidadeOrigem)
);

CREATE TABLE Item_Interno (
    DataValidade DATE,
    DescricaoProduto VARCHAR(255),
    RegiaoProduto VARCHAR(100),
    PaisProduto VARCHAR(100),
    CidadeProduto VARCHAR(100),
    DataConfeccao DATE NOT NULL,
    PRIMARY KEY (DataValidade, DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto),
    FOREIGN KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto) 
        REFERENCES Produto(Descricao, RegiaoOrigem, PaisOrigem, CidadeOrigem)
);

CREATE TABLE Item_Pedido (
    DataPedido DATE,
    TelefonePedido VARCHAR(20),
    DescricaoProduto VARCHAR(255),
    RegiaoProduto VARCHAR(100),
    PaisProduto VARCHAR(100),
    CidadeProduto VARCHAR(100),
    Quantidade INT NOT NULL,
    Descricao VARCHAR(255),
    PRIMARY KEY (DataPedido, TelefonePedido, DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto),
    FOREIGN KEY (DataPedido, TelefonePedido) 
        REFERENCES Pedido(Data, TelefoneCliente),
    FOREIGN KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto) 
        REFERENCES Produto(Descricao, RegiaoOrigem, PaisOrigem, CidadeOrigem)
);

CREATE TABLE Encomenda_Contem_Produto (
    DataEncomenda DATE,
    TelefoneCliente VARCHAR(20),
    DescricaoProduto VARCHAR(255),
    RegiaoProduto VARCHAR(100),
    PaisProduto VARCHAR(100),
    CidadeProduto VARCHAR(100),
    Quantidade INT NOT NULL,
    PRIMARY KEY (DataEncomenda, TelefoneCliente, DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto),
    FOREIGN KEY (DataEncomenda, TelefoneCliente) 
        REFERENCES Encomenda(Data, TelefoneCliente),
    FOREIGN KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto) 
        REFERENCES Produto(Descricao, RegiaoOrigem, PaisOrigem, CidadeOrigem)
);

CREATE TABLE Prepara (
    DescricaoProduto VARCHAR(255),
    RegiaoProduto VARCHAR(100),
    PaisProduto VARCHAR(100),
    CidadeProduto VARCHAR(100),
    NomeAcessorio VARCHAR(100),
    TempoPreparo INTERVAL NOT NULL,
    PRIMARY KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto, NomeAcessorio),
    FOREIGN KEY (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto) 
        REFERENCES Produto(Descricao, RegiaoOrigem, PaisOrigem, CidadeOrigem),
    FOREIGN KEY (NomeAcessorio) 
        REFERENCES Acessorios(Nome)
);

CREATE TABLE IndicacaoSommelier (
    DescricaoQueijo VARCHAR(255),
    RegiaoQueijo VARCHAR(100),
    PaisQueijo VARCHAR(100),
    CidadeQueijo VARCHAR(100),
    DescricaoBebida VARCHAR(255),
    RegiaoBebida VARCHAR(100),
    PaisBebida VARCHAR(100),
    CidadeBebida VARCHAR(100),
    PRIMARY KEY (DescricaoQueijo, RegiaoQueijo, PaisQueijo, CidadeQueijo, DescricaoBebida, RegiaoBebida, PaisBebida, CidadeBebida),
    FOREIGN KEY (DescricaoQueijo, RegiaoQueijo, PaisQueijo, CidadeQueijo) 
        REFERENCES Queijos(DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto),
    FOREIGN KEY (DescricaoBebida, RegiaoBebida, PaisBebida, CidadeBebida) 
        REFERENCES Bebida_Alcoolica(DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto)
);