select p1.id_membro,p2.id_membro,count(p1.cluster)
from publicacao as p1, publicacao as p2 
where 
p1.cluster = p2.cluster
and p1.id_membro < p2.id_membro 
and p1.ano = 2008
--and p1.id_membro in () and p2.id_membro in ()
group by p1.id_membro,p2.id_membro 
order by p1.id_membro, p2.id_membro