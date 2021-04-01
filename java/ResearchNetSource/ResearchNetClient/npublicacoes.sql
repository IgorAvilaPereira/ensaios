-- n publicacoes de cada tipo por ano
select tipo.descricao, ano, count(id_publicacao)
from publicacao, tipo
where (cluster is null or cluster = id_publicacao)
and tipo.id_tipo = publicacao.tipo
group by ano, tipo.descricao
order by tipo.descricao, ano;

-- n publicacoes de cada membro
select nome, count(id_publicacao)
from publicacao, membros
where publicacao.id_membro = membros.id_membro
group by nome
order by nome;

-- n publicacoes de cada membro por ano
select nome, ano, count(id_publicacao)
from publicacao, membros
where publicacao.id_membro = membros.id_membro
group by ano, nome
order by nome, ano;

-- n publicacoes de cada membro por tipo
select nome, tipo.descricao, count(id_publicacao)
from publicacao, tipo, membros
where tipo.id_tipo = publicacao.tipo
and membros.id_membro = publicacao.id_membro
group by nome, tipo.descricao
order by nome, tipo.descricao;


-- n publicacoes de cada pesquisador por ano e tipo
select nome, ano, tipo.descricao, count(id_publicacao)
from publicacao, tipo, membros
where tipo.id_tipo = publicacao.tipo
and membros.id_membro = publicacao.id_membro
group by ano, tipo.descricao, nome
order by nome, ano, tipo.descricao

-- ZERO publicacoes
select nome
from membros
left join publicacao
on publicacao.id_membro = membros.id_membro
group by nome
having count(id_publicacao) = 0
order by nome;
