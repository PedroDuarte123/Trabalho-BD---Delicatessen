-- popular_banco_sem_napa.sql
-- Popula o banco Delicatessen sem registros de Napa Valley
-- Acessorios corrigidos: utensilios/equipamentos de preparo de cafe e cha.

TRUNCATE TABLE
    IndicacaoSommelier,
    Prepara,
    Customizado,
    Item_Pedido,
    Item_Interno,
    Item_Estoque,
    Bebida_Preparada,
    Bebida_Alcoolica,
    Queijos,
    ProdutoInformacao,
    Produto,
    Pedido,
    Acessorios,
    Origem,
    Cliente
CASCADE;

INSERT INTO Cliente (Telefone, Nome) VALUES
('21999990001','Joao Silva'),
('21999990002','Maria Souza'),
('21999990003','Pedro Santos'),
('21999990004','Ana Costa'),
('21999990005','Lucas Lima'),
('21999990006','Julia Rocha'),
('21999990007','Carlos Alves'),
('21999990008','Fernanda Melo'),
('21999990009','Rafael Gomes'),
('21999990010','Beatriz Martins');

INSERT INTO Origem (Regiao, Pais, Cidade) VALUES
('Minas Gerais','Brasil','Serro'),
('Minas Gerais','Brasil','Canastra'),
('Sao Paulo','Brasil','Campos do Jordao'),
('Rio Grande do Sul','Brasil','Bento Goncalves'),
('Porto','Portugal','Porto'),
('Champagne','Franca','Reims'),
('Toscana','Italia','Florenca'),
('Andaluzia','Espanha','Jerez'),
('Baviera','Alemanha','Munique'),
('Parana','Brasil','Curitiba');

INSERT INTO Acessorios (Nome, TipoPreparo) VALUES
('Filtro V60','Filtragem'),
('Prensa Francesa','Infusao'),
('Cafeteira Italiana','Pressao'),
('Bule de Vidro','Infusao'),
('Infusor de Cha','Infusao'),
('Filtro de Papel','Filtragem'),
('Moedor Manual','Moagem'),
('Chaleira Pescoço de Ganso','Aquecimento'),
('Aeropress','Pressao'),
('Chemex','Filtragem');

INSERT INTO Pedido (Data, TelefoneCliente, Status, Tipo) VALUES
('2026-01-01 10:00:00','21999990001','Entregue','Online'),
('2026-01-02 10:00:00','21999990002','Entregue','Online'),
('2026-01-03 10:00:00','21999990003','Pendente','Loja'),
('2026-01-04 10:00:00','21999990004','Entregue','Loja'),
('2026-01-05 10:00:00','21999990005','Pendente','Online'),
('2026-01-06 10:00:00','21999990006','Entregue','Online'),
('2026-01-07 10:00:00','21999990007','Cancelado','Loja'),
('2026-01-08 10:00:00','21999990008','Entregue','Online'),
('2026-01-09 10:00:00','21999990009','Pendente','Loja'),
('2026-01-10 10:00:00','21999990010','Entregue','Online');

INSERT INTO Produto (Descricao, RegiaoOrigem, PaisOrigem, CidadeOrigem) VALUES
('Queijo Canastra','Minas Gerais','Brasil','Canastra'),
('Queijo Serro','Minas Gerais','Brasil','Serro'),
('Brie Frances','Champagne','Franca','Reims'),
('Gouda Especial','Baviera','Alemanha','Munique'),
('Vinho Tinto Toscana','Toscana','Italia','Florenca'),
('Vinho do Porto','Porto','Portugal','Porto'),
('Cerveja de Trigo Baviera','Baviera','Alemanha','Munique'),
('Cafe Especial','Sao Paulo','Brasil','Campos do Jordao'),
('Chocolate Quente','Parana','Brasil','Curitiba'),
('Cha Gourmet','Rio Grande do Sul','Brasil','Bento Goncalves');

INSERT INTO ProdutoInformacao (DescricaoProduto, Nome, Categoria) VALUES
('Queijo Canastra','Canastra Premium','Queijo'),
('Queijo Serro','Serro Artesanal','Queijo'),
('Brie Frances','Brie Cremoso','Queijo'),
('Gouda Especial','Gouda Envelhecido','Queijo'),
('Vinho Tinto Toscana','Chianti Classico','Bebida Alcoolica'),
('Vinho do Porto','Porto Ruby','Bebida Alcoolica'),
('Cerveja de Trigo Baviera','Weissbier Artesanal','Bebida Alcoolica'),
('Cafe Especial','Cafe Gourmet Moido na Hora','Bebida Preparada'),
('Chocolate Quente','Chocolate Cremoso','Bebida Preparada'),
('Cha Gourmet','Cha de Ervas Gourmet','Bebida Preparada');

INSERT INTO Queijos (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto) VALUES
('Queijo Canastra','Minas Gerais','Brasil','Canastra'),
('Queijo Serro','Minas Gerais','Brasil','Serro'),
('Brie Frances','Champagne','Franca','Reims'),
('Gouda Especial','Baviera','Alemanha','Munique');

INSERT INTO Bebida_Alcoolica (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto, TeorAlcoolico) VALUES
('Vinho Tinto Toscana','Toscana','Italia','Florenca',13.50),
('Vinho do Porto','Porto','Portugal','Porto',19.00),
('Cerveja de Trigo Baviera','Baviera','Alemanha','Munique',5.20);

INSERT INTO Bebida_Preparada (DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto) VALUES
('Cafe Especial','Sao Paulo','Brasil','Campos do Jordao'),
('Chocolate Quente','Parana','Brasil','Curitiba'),
('Cha Gourmet','Rio Grande do Sul','Brasil','Bento Goncalves');

INSERT INTO Item_Estoque (DataValidade, DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto, Quantidade) VALUES
('2026-12-01','Queijo Canastra','Minas Gerais','Brasil','Canastra',20),
('2026-12-02','Queijo Serro','Minas Gerais','Brasil','Serro',15),
('2026-12-03','Brie Frances','Champagne','Franca','Reims',10),
('2026-12-04','Gouda Especial','Baviera','Alemanha','Munique',12),
('2026-12-05','Vinho Tinto Toscana','Toscana','Italia','Florenca',25),
('2026-12-06','Vinho do Porto','Porto','Portugal','Porto',18),
('2026-12-07','Cerveja de Trigo Baviera','Baviera','Alemanha','Munique',30),
('2026-12-08','Cafe Especial','Sao Paulo','Brasil','Campos do Jordao',30),
('2026-12-09','Chocolate Quente','Parana','Brasil','Curitiba',22),
('2026-12-10','Cha Gourmet','Rio Grande do Sul','Brasil','Bento Goncalves',40);

INSERT INTO Item_Interno (DataValidade, DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto, DataConfeccao) VALUES
('2026-12-01','Queijo Canastra','Minas Gerais','Brasil','Canastra','2026-06-01 08:00:00'),
('2026-12-02','Queijo Serro','Minas Gerais','Brasil','Serro','2026-06-02 08:00:00'),
('2026-12-03','Brie Frances','Champagne','Franca','Reims','2026-06-03 08:00:00'),
('2026-12-04','Gouda Especial','Baviera','Alemanha','Munique','2026-06-04 08:00:00'),
('2026-12-05','Vinho Tinto Toscana','Toscana','Italia','Florenca','2026-06-05 08:00:00'),
('2026-12-06','Vinho do Porto','Porto','Portugal','Porto','2026-06-06 08:00:00'),
('2026-12-07','Cerveja de Trigo Baviera','Baviera','Alemanha','Munique','2026-06-07 08:00:00'),
('2026-12-08','Cafe Especial','Sao Paulo','Brasil','Campos do Jordao','2026-06-08 08:00:00'),
('2026-12-09','Chocolate Quente','Parana','Brasil','Curitiba','2026-06-09 08:00:00'),
('2026-12-10','Cha Gourmet','Rio Grande do Sul','Brasil','Bento Goncalves','2026-06-10 08:00:00');

INSERT INTO Item_Pedido (DataPedido, TelefonePedido, DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto, Quantidade, Descricao) VALUES
('2026-01-01 10:00:00','21999990001','Queijo Canastra','Minas Gerais','Brasil','Canastra',1,'Queijo artesanal para presente'),
('2026-01-02 10:00:00','21999990002','Queijo Serro','Minas Gerais','Brasil','Serro',2,'Queijo regional meia cura'),
('2026-01-03 10:00:00','21999990003','Brie Frances','Champagne','Franca','Reims',1,'Queijo macio importado'),
('2026-01-04 10:00:00','21999990004','Gouda Especial','Baviera','Alemanha','Munique',1,'Queijo envelhecido'),
('2026-01-05 10:00:00','21999990005','Vinho Tinto Toscana','Toscana','Italia','Florenca',3,'Vinho para harmonizacao'),
('2026-01-06 10:00:00','21999990006','Vinho do Porto','Porto','Portugal','Porto',1,'Vinho licoroso'),
('2026-01-07 10:00:00','21999990007','Cerveja de Trigo Baviera','Baviera','Alemanha','Munique',4,'Cerveja artesanal de trigo'),
('2026-01-08 10:00:00','21999990008','Cafe Especial','Sao Paulo','Brasil','Campos do Jordao',2,'Cafe fresco moido na hora'),
('2026-01-09 10:00:00','21999990009','Chocolate Quente','Parana','Brasil','Curitiba',1,'Bebida quente cremosa'),
('2026-01-10 10:00:00','21999990010','Cha Gourmet','Rio Grande do Sul','Brasil','Bento Goncalves',2,'Cha gourmet de ervas');

INSERT INTO Customizado (DataItem, TelefoneItem, DescricaoProduto, RegiaoProduto, PaisProduto, CidadeProduto, Quantidade) VALUES
('2026-01-01 10:00:00','21999990001','Queijo Canastra','Minas Gerais','Brasil','Canastra',1),
('2026-01-02 10:00:00','21999990002','Queijo Serro','Minas Gerais','Brasil','Serro',2),
('2026-01-03 10:00:00','21999990003','Brie Frances','Champagne','Franca','Reims',1),
('2026-01-04 10:00:00','21999990004','Gouda Especial','Baviera','Alemanha','Munique',1),
('2026-01-05 10:00:00','21999990005','Vinho Tinto Toscana','Toscana','Italia','Florenca',3),
('2026-01-06 10:00:00','21999990006','Vinho do Porto','Porto','Portugal','Porto',1),
('2026-01-07 10:00:00','21999990007','Cerveja de Trigo Baviera','Baviera','Alemanha','Munique',4),
('2026-01-08 10:00:00','21999990008','Cafe Especial','Sao Paulo','Brasil','Campos do Jordao',2),
('2026-01-09 10:00:00','21999990009','Chocolate Quente','Parana','Brasil','Curitiba',1),
('2026-01-10 10:00:00','21999990010','Cha Gourmet','Rio Grande do Sul','Brasil','Bento Goncalves',2);

INSERT INTO Prepara (DescricaoBebida, RegiaoBebida, PaisBebida, CidadeBebida, NomeAcessorio, TempoPreparo) VALUES
('Cafe Especial','Sao Paulo','Brasil','Campos do Jordao','Filtro V60','00:04:00'),
('Cafe Especial','Sao Paulo','Brasil','Campos do Jordao','Prensa Francesa','00:05:00'),
('Cafe Especial','Sao Paulo','Brasil','Campos do Jordao','Cafeteira Italiana','00:06:00'),
('Cafe Especial','Sao Paulo','Brasil','Campos do Jordao','Moedor Manual','00:02:00'),
('Cafe Especial','Sao Paulo','Brasil','Campos do Jordao','Aeropress','00:03:00'),
('Chocolate Quente','Parana','Brasil','Curitiba','Bule de Vidro','00:07:00'),
('Chocolate Quente','Parana','Brasil','Curitiba','Chaleira Pescoço de Ganso','00:05:00'),
('Cha Gourmet','Rio Grande do Sul','Brasil','Bento Goncalves','Infusor de Cha','00:04:00'),
('Cha Gourmet','Rio Grande do Sul','Brasil','Bento Goncalves','Filtro de Papel','00:03:00'),
('Cha Gourmet','Rio Grande do Sul','Brasil','Bento Goncalves','Chemex','00:05:00');

INSERT INTO IndicacaoSommelier (
    DescricaoQueijo, RegiaoQueijo, PaisQueijo, CidadeQueijo,
    DescricaoBebida, RegiaoBebida, PaisBebida, CidadeBebida
) VALUES
('Queijo Canastra','Minas Gerais','Brasil','Canastra','Vinho Tinto Toscana','Toscana','Italia','Florenca'),
('Queijo Serro','Minas Gerais','Brasil','Serro','Vinho do Porto','Porto','Portugal','Porto'),
('Brie Frances','Champagne','Franca','Reims','Vinho Tinto Toscana','Toscana','Italia','Florenca'),
('Gouda Especial','Baviera','Alemanha','Munique','Cerveja de Trigo Baviera','Baviera','Alemanha','Munique');
