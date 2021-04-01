delete from versionado.adjacencia where versao > (select atual from versao);

delete from versionado.capitulo where versao > (select atual from versao);

delete from versionado.componente where versao > (select atual from versao);

delete from versionado.conferencia where versao > (select atual from versao);

delete from versionado.diametro where versao > (select atual from versao);

delete from versionado.grafo where versao > (select atual from versao);

delete from versionado.livro where versao > (select atual from versao);

delete from versionado.replica where versao > (select atual from versao);

delete from versionado.revista where versao > (select atual from versao);

delete from versionado.revista_aceito where versao > (select atual from versao);

delete from versionado.publicacao where versao > (select atual from versao);

delete from versionado.membros where versao > (select atual from versao);