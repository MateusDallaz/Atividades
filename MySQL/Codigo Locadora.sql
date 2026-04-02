CREATE TABLE locacao(
	contrato_locacao INT PRIMARY KEY NOT NULL,
    data_locacao DATE,
    matiricula int,
    CONSTRAINT fkmatricula_funcionario FOREIGN KEY 
    (matiricula) REFERENCES funcionario(matiricula)
    ); 