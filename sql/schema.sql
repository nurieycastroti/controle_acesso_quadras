PRAGMA foreign_keys = ON;

CREATE TABLE planos (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    acesso_livre INTEGER NOT NULL CHECK (acesso_livre IN (0, 1))
);

CREATE TABLE alunos (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    plano_id INTEGER NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('ativo', 'inativo')),
    FOREIGN KEY (plano_id) REFERENCES planos(id)
);

CREATE TABLE professores (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    modalidade TEXT NOT NULL
);

CREATE TABLE quadras (
    id INTEGER PRIMARY KEY,
    numero INTEGER NOT NULL UNIQUE
);

CREATE TABLE aulas (
    id INTEGER PRIMARY KEY,
    professor_id INTEGER NOT NULL,
    quadra_id INTEGER NOT NULL,
    dia_semana INTEGER NOT NULL CHECK (dia_semana BETWEEN 1 AND 7),
    horario_inicio TEXT NOT NULL,
    duracao_minutos INTEGER NOT NULL CHECK (duracao_minutos > 0),
    FOREIGN KEY (professor_id) REFERENCES professores(id),
    FOREIGN KEY (quadra_id) REFERENCES quadras(id)
);

CREATE TABLE matriculas (
    id INTEGER PRIMARY KEY,
    aluno_id INTEGER NOT NULL,
    aula_id INTEGER NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (aula_id) REFERENCES aulas(id),
    UNIQUE (aluno_id, aula_id)
);

CREATE TABLE mensalidades (
    id INTEGER PRIMARY KEY,
    aluno_id INTEGER NOT NULL,
    mes_referencia INTEGER NOT NULL CHECK (mes_referencia BETWEEN 1 AND 12),
    ano_referencia INTEGER NOT NULL,
    data_vencimento TEXT NOT NULL,
    data_pagamento TEXT,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);

CREATE TABLE ocupacoes (
    id INTEGER PRIMARY KEY,
    quadra_id INTEGER NOT NULL,
    motivo TEXT NOT NULL CHECK (
        motivo IN ('evento', 'manutencao', 'day_use')
    ),
    inicio TEXT NOT NULL,
    fim TEXT,
    FOREIGN KEY (quadra_id) REFERENCES quadras(id),
    CHECK (
        (fim IS NULL AND motivo = 'day_use')
        OR
        (fim IS NOT NULL AND fim > inicio)
    )
);

CREATE TABLE acessos (
    id INTEGER PRIMARY KEY,
    aluno_id INTEGER,
    data_hora TEXT NOT NULL,
    status TEXT NOT NULL CHECK (
        status IN ('permitido', 'negado')
    ),
    motivo TEXT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    CHECK (
        aluno_id IS NOT NULL OR status = 'negado'
    )
);
