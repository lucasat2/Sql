-- Abaixo estão as 5 solicitações da diretoria. Você precisa escrever a consulta SQL correta para responder a cada uma delas.
-- 🧪 Desafio 1 — Fila de Aprovação (Visão do RH) O time de recrutamento precisa processar quem está aguardando resposta.

-- 👉Ação: Crie uma consulta que retorne o Nome do Aluno, o Título da Vaga e a Data de Aplicação, apenas para candidaturas com o status "Pendente". Ordene da aplicação mais antiga para a mais recente.

SELECT 
    alunos.nome, 
    vagas.titulo_vaga, 
    candidaturas.data_aplicacao
FROM candidaturas
JOIN alunos ON candidaturas.aluno_id = alunos.id
JOIN vagas ON candidaturas.vaga_id = vagas.id
WHERE candidaturas.status = 'Pendente'
ORDER BY candidaturas.data_aplicacao ASC;


-- 🧪 Desafio 2 — O Ranking da Comunidade (Gamificação)

-- 👉 //Ação: Crie um ranking mostrando o Nome do Aluno e a Média de Pontuação dele nos desafios técnicos. Mas atenção: o ranking só deve incluir alunos com o nível "Teach Lead". Ordene da maior média para a menor.

SELECT 
	alunos.nome,
	AVG(desafios_tecnicos.pontuacao) AS media_aluno
FROM alunos
JOIN desafios_tecnicos ON desafios_tecnicos.aluno_id = alunos.id
GROUP BY alunos.nome
ORDER BY media_aluno DESC


-- Desafio 3 — Funil de Contratação - Como está a saúde da nossa plataforma?
-- Ação: Crie uma consulta que mostre o total de candidaturas agrupadas por status (quantas estão Pendentes, quantas Rejeitadas e quantas Aprovadas).

SELECT 
    status, 
    COUNT(id) 
FROM candidaturas 
GROUP BY status;


-- 🧪 Desafio 4 — Caça-Talentos (Nível Avançado) - A diretoria suspeita que temos gênios na plataforma que têm medo de se candidatar.
--  👉 Ação: Liste o Nome e o E-mail de alunos que tenham uma média de pontuação em desafios superior a 80, MAS que nunca se candidataram a nenhuma vaga. (Dica: Pense no uso de LEFT JOIN e verificação de nulos).


SELECT 
    alunos.nome, 
    alunos.email
FROM alunos
JOIN desafios_tecnicos ON alunos.id = desafios_tecnicos.aluno_id
LEFT JOIN candidaturas ON alunos.id = candidaturas.aluno_id
WHERE candidaturas.id IS NULL
GROUP BY alunos.id, alunos.nome, alunos.email
HAVING AVG(desafios_tecnicos.pontuacao) > 80;


-- 🧪 Desafio 5 — O "Mini Dashboard" da Diretoria (Nível Chefe)
-- 👉 Ação: Crie uma VIEW chamada relatorio_talentos que junte os dados do aluno (nome e email), o nome da vaga que ele aplicou e o status dessa candidatura. Essa View será consultada todos os dias pelo CEO da empresa.


CREATE VIEW relatorio_talentos AS
SELECT 
    alunos.nome,
    alunos.email,
    vagas.titulo_vaga,
    candidaturas.status
FROM candidaturas
JOIN alunos ON candidaturas.aluno_id = alunos.id
JOIN vagas ON candidaturas.vaga_id = vagas.id;

