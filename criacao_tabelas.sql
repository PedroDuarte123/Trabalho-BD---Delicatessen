CREATE TABLE Cliente (
    Telefone VARCHAR(20) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Origem (
    Regiao VARCHAR(100),
    Pais VARCHAR(100),
    Cidade VARCHAR(100),
    PRIMARY KEY (Regiao, Pais, Cidade)
);


CREATE TABLE Acessorios (
    Nome VARCHAR(100) PRIMARY KEY,
    TipoPreparo VARCHAR(100) NOT NULL
);

CREATE TABLE Produto (
    Descricao VARCHAR(255),
    RegiaoOrigem VARCHAR(100),
    PaisOrigem VARCHAR(100),
    CidadeOrigem VARCHAR(100),
    Nome VARCHAR(150) NOT NULL,
    Categoria VARCHAR(100) NOT NULL,
    
    PRIMARY KEY (Descricao, RegiaoOrigem, PaisOrigem, CidadeOrigem),
    
    FOREIGN KEY (RegiaoOrigem, PaisOrigem, CidadeOrigem) 
        REFERENCES Origem (Regiao, Pais, Cidade)
);