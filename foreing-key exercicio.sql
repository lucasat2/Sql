-- 1. Criar a tabela alunos
CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

-- 2. Criar a tabela cursos
CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

-- 3. Criar a tabela matriculas relacionando aluno e curso
CREATE TABLE matriculas (
    id SERIAL PRIMARY KEY,
    aluno_id INT,
    curso_id INT,
    data_matricula DATE,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

-- Inserir dados válidos para teste
INSERT INTO alunos (nome) VALUES ('Lucas');
INSERT INTO cursos (nome) VALUES ('Banco de Dados');

-- Inserir matrícula válida (aluno 1 e curso 1 existem)
INSERT INTO matriculas (aluno_id, curso_id, data_matricula)
VALUES (1, 1, '2026-10-01');

-- Testar erro de chave estrangeira (aluno 999 não existe)
INSERT INTO matriculas (aluno_id, curso_id)
VALUES (999, 1);
