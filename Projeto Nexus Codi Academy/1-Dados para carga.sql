CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL,
    nivel_comunidade VARCHAR(50) CHECK(nivel_comunidade IN ('Iniciante', 'Estagiário', 'Teach Lead')) NOT NULL
);

CREATE TABLE vagas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_vaga VARCHAR(100) NOT NULL,
    empresa VARCHAR(100) NOT NULL,
    nivel_exigido VARCHAR(50) NOT NULL
);

CREATE TABLE candidaturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    vaga_id INT,
    data_aplicacao DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'Pendente' CHECK(status IN ('Pendente', 'Aprovado', 'Rejeitado')),
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE,
    FOREIGN KEY (vaga_id) REFERENCES vagas(id) ON DELETE CASCADE
);

CREATE TABLE desafios_tecnicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    pontuacao INT CHECK(pontuacao BETWEEN 0 AND 100),
    tecnologia VARCHAR(50) NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE
);

-- Populando o banco com dados reais
INSERT INTO alunos (nome, email, data_cadastro, nivel_comunidade) VALUES
('Ana Silva', 'ana.silva@email.com', '2026-01-10', 'Teach Lead'),
('Bruno Santos', 'bruno.santos@email.com', '2026-01-15', 'Estagiário'),
('Carlos Souza', 'carlos.souza@email.com', '2026-02-01', 'Iniciante'),
('Daniela Lima', 'daniela.lima@email.com', '2026-02-12', 'Teach Lead'),
('Eduardo Costa', 'eduardo.costa@email.com', '2026-03-01', 'Estagiário'),
('Fernanda Oliveira', 'fernanda.oliveira@email.com', '2026-03-15', 'Teach Lead'),
('Gabriel Almeida', 'gabriel.almeida@email.com', '2026-04-02', 'Iniciante');

INSERT INTO vagas (titulo_vaga, empresa, nivel_exigido) VALUES
('Desenvolvedor Frontend Júnior', 'TechCorp', 'Júnior'),
('Desenvolvedor Backend Júnior', 'DataSoft', 'Júnior'),
('Estagiário em Banco de Dados', 'CloudNet', 'Estágio'),
('Analista de Dados Júnior', 'FintechX', 'Júnior');

INSERT INTO candidaturas (aluno_id, vaga_id, data_aplicacao, status) VALUES
(1, 1, '2026-05-01', 'Aprovado'),
(1, 2, '2026-05-03', 'Rejeitado'),
(2, 3, '2026-05-10', 'Pendente'),
(4, 1, '2026-05-15', 'Pendente'),
(4, 4, '2026-05-20', 'Aprovado'),
(5, 3, '2026-05-25', 'Pendente');

INSERT INTO desafios_tecnicos (aluno_id, pontuacao, tecnologia) VALUES
(1, 90, 'React'),
(1, 85, 'JavaScript'),
(2, 70, 'Python'),
(4, 95, 'Node.js'),
(4, 88, 'SQL'),
(5, 60, 'SQL'),
(6, 98, 'Node.js'),
(6, 92, 'SQL');