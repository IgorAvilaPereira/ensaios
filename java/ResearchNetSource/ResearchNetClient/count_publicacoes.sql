select count(id_publicacao), ano, tipo.descricao
from publicacao, tipo
where (cluster is null or cluster = id_publicacao)
and tipo.id_tipo = publicacao.tipo
group by ano, tipo.descricao
order by tipo.descricao, ano
