#!/usr/bin/python
# encoding: utf-8
#
#
#  scriptLattes V8
#  Copyright 2005-2011: Jesús P. Mena-Chalco e Roberto M. Cesar-Jr.
#  http://scriptlattes.sourceforge.net/
#
#
#  Este programa é um software livre; você pode redistribui-lo e/ou 
#  modifica-lo dentro dos termos da Licença Pública Geral GNU como 
#  publicada pela Fundação do Software Livre (FSF); na versão 2 da 
#  Licença, ou (na sua opnião) qualquer versão.
#
#  Este programa é distribuido na esperança que possa ser util, 
#  mas SEM NENHUMA GARANTIA; sem uma garantia implicita de ADEQUAÇÂO a qualquer
#  MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
#  Licença Pública Geral GNU para maiores detalhes.
#
#  Você deve ter recebido uma cópia da Licença Pública Geral GNU
#  junto com este programa, se não, escreva para a Fundação do Software
#  Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

import sys
import shutil
import Levenshtein
import os, errno
import psycopg2

sys.path.append('scriptLattes')
sys.path.append('scriptLattes/producoesBibliograficas/')
sys.path.append('scriptLattes/producoesTecnicas/')
sys.path.append('scriptLattes/producoesArtisticas/')
sys.path.append('scriptLattes/producoesUnitarias/')
sys.path.append('scriptLattes/orientacoes/')
sys.path.append('scriptLattes/eventos/')
sys.path.append('scriptLattes/charts/')

from grupo import *

if True:
	arquivoConfiguracao = './exemplo/teste.config'
	
	arquivoSaida=open('saida.txt','w');
	
	conn = psycopg2.connect("dbname='lattes' user='postgres' host='localhost' password='postgres' ");
	cur = conn.cursor()
	
	cur.execute("TRUNCATE membros RESTART IDENTITY CASCADE")
	#cur.execute("TRUNCATE publicacao CASCADE")
	conn.commit()

	
	novoGrupo = Grupo(arquivoConfiguracao)
	novoGrupo.imprimirListaDeParametros()

	if criarDiretorio(novoGrupo.obterParametro('global-diretorio_de_saida')):
		novoGrupo.carregarDadosCVLattes()
		
		#Adiciona as informacoes obtidas do lattes no arquivo texto
		for i,m in enumerate(novoGrupo.listaDeMembros):	
			print >>arquivoSaida, "MEMBRO "+m.nomeCompleto.encode("utf8")+";"+m.idLattes.encode("utf8")
			print >>arquivoSaida, "ID "+str(i)
			for p in m.listaArtigoEmPeriodico:
				print >>arquivoSaida, "ARTPUBLI "+p.item.encode("utf8")
				
			for p in m.listaLivroPublicado:
				print >>arquivoSaida, "LIVRO "+p.item.encode("utf8")
				
			for p in m.listaCapituloDeLivroPublicado:
				print >>arquivoSaida, "CAPLIVRO "+p.item.encode("utf8")
				
			for p in m.listaTrabalhoCompletoEmCongresso:
				print >>arquivoSaida, "TRAB "+p.item.encode("utf8")
				
			for p in m.listaArtigoAceito:
				print >>arquivoSaida, "ARTACEITO "+p.item.encode("utf8")
				
	
		
		#Adiciona as informacoes obtidas do lattes no banco de dados
		for i,m in enumerate(novoGrupo.listaDeMembros):
			nome=m.nomeCompleto.encode("utf8")
			idLattes=m.idLattes.encode("utf8")
			id_membro=i
			cur.execute("INSERT INTO membros (id_membro, nome,id_lattes) VALUES (%s,%s,%s)",(id_membro,nome,idLattes))
			
			for p in m.listaArtigoEmPeriodico:
				tipo="AP"
				doi = p.doi.encode("utf8")
				autores = p.autores.encode("utf8")
				titulo = p.titulo.encode("utf8").replace("\'","")
				revista = p.revista.encode("utf8")
				volume = p.volume.encode("utf8")
				paginas = p.paginas.encode("utf8")
				numero = p.numero.encode("utf8")
				ano = p.ano
				
				cur.execute("INSERT INTO publicacao (tipo, titulo, autores, ano, paginas, id_membro) VALUES (%s,%s,%s,%s,%s,%s) RETURNING id_publicacao", (tipo,titulo,autores,ano,paginas,id_membro))
				#cur.execute("INSERT INTO publicacao (tipo, titulo, autores, ano, paginas) VALUES (%s,%s,%s,%s,%s) RETURNING id_publicacao", (tipo,titulo,autores,ano,paginas))
				
				id_publicacao=cur.fetchone()[0]
				
				p.id_publicacao=id_publicacao
				
				cur.execute("INSERT INTO revista (id_publicacao,doi,revista,volume,numero) VALUES (%s,%s,%s,%s,%s)", (id_publicacao,doi,revista,volume,numero))
				
				#cur.execute("INSERT INTO autoria (id_membro,id_publicacao) VALUES (%s,%s)",(id_membro, id_publicacao))
			
			for p in m.listaArtigoAceito:
				tipo="AA"
				doi = p.doi.encode("utf8")
				autores = p.autores.encode("utf8")
				titulo = p.titulo.encode("utf8").replace("\'","")
				revista = p.revista.encode("utf8")
				paginas = p.paginas.encode("utf8")
				numero = p.numero.encode("utf8")
				ano = p.ano				
				
				cur.execute("INSERT INTO publicacao (tipo, titulo, autores, ano, paginas, id_membro) VALUES (%s,%s,%s,%s,%s,%s) RETURNING id_publicacao", (tipo,titulo,autores,ano,paginas,id_membro))
				#cur.execute("INSERT INTO publicacao (tipo, titulo, autores, ano, paginas) VALUES (%s,%s,%s,%s,%s) RETURNING id_publicacao", (tipo,titulo,autores,ano,paginas))
				
				id_publicacao=cur.fetchone()[0]
				
				p.id_publicacao=id_publicacao
				
				cur.execute("INSERT INTO revista_aceito (id_publicacao,doi,revista,numero) VALUES (%s,%s,%s,%s)", (id_publicacao,doi,revista,numero))
				
				#cur.execute("INSERT INTO autoria (id_membro,id_publicacao) VALUES (%s,%s)",(id_membro, id_publicacao))
			
			for p in m.listaLivroPublicado:
				tipo="LP"
				autores = p.autores.encode("utf8")
				titulo = p.titulo.encode("utf8").replace("\'","")
				edicao = p.edicao.encode("utf8")
				ano = p.ano
				volume = p.volume.encode("utf8")
				paginas = p.paginas.encode("utf8")
				
				cur.execute("INSERT INTO publicacao (tipo, titulo, autores, ano, paginas, id_membro) VALUES (%s,%s,%s,%s,%s,%s) RETURNING id_publicacao", (tipo,titulo,autores,ano,paginas,id_membro))
				#cur.execute("INSERT INTO publicacao (tipo, titulo, autores, ano, paginas) VALUES (%s,%s,%s,%s,%s) RETURNING id_publicacao", (tipo,titulo,autores,ano,paginas))
				
				id_publicacao=cur.fetchone()[0]
				
				p.id_publicacao=id_publicacao
				
				cur.execute("INSERT INTO livro (id_publicacao,edicao,volume) VALUES (%s,%s,%s)",(id_publicacao,edicao,volume))
				
				#cur.execute("INSERT INTO autoria (id_membro,id_publicacao) VALUES (%s,%s)",(id_membro, id_publicacao))
			
			for p in m.listaCapituloDeLivroPublicado:
				tipo="CL"
				autores = p.autores.encode("utf8")
				titulo = p.titulo.encode("utf8").replace("\'","")
				livro = p.livro.encode("utf8")
				edicao = p.edicao.encode("utf8")
				editora = p.editora.encode("utf8")
				ano = p.ano
				volume = p.volume.encode("utf8")
				paginas = p.paginas.encode("utf8")
				
				cur.execute("INSERT INTO publicacao (tipo, titulo, autores, ano, paginas, id_membro) VALUES (%s,%s,%s,%s,%s,%s) RETURNING id_publicacao", (tipo,titulo,autores,ano,paginas,id_membro))
				#cur.execute("INSERT INTO publicacao (tipo, titulo, autores, ano, paginas) VALUES (%s,%s,%s,%s,%s) RETURNING id_publicacao", (tipo,titulo,autores,ano,paginas))
				
				id_publicacao=cur.fetchone()[0]
				
				p.id_publicacao=id_publicacao
				
				cur.execute("INSERT INTO capitulo (id_publicacao,livro,edicao,editora,volume) VALUES (%s,%s,%s,%s,%s)", (id_publicacao,livro,edicao,editora,volume))
				
				#cur.execute("INSERT INTO autoria (id_membro,id_publicacao) VALUES (%s,%s)",(id_membro, id_publicacao))

			for p in m.listaTrabalhoCompletoEmCongresso:
				tipo="TC"				
				autores = p.autores.encode("utf8")
				titulo = p.titulo.encode("utf8").replace("\'","")
				evento = p.nomeDoEvento.encode("utf8")
				ano = p.ano
				volume = p.volume.encode("utf8")
				paginas = p.paginas.encode("utf8")
				
				cur.execute("INSERT INTO publicacao (tipo, titulo, autores, ano, paginas, id_membro) VALUES (%s,%s,%s,%s,%s,%s) RETURNING id_publicacao", (tipo,titulo,autores,ano,paginas,id_membro))
				#cur.execute("INSERT INTO publicacao (tipo, titulo, autores, ano, paginas) VALUES (%s,%s,%s,%s,%s) RETURNING id_publicacao", (tipo,titulo,autores,ano,paginas))

				id_publicacao=cur.fetchone()[0]
				
				p.id_publicacao=id_publicacao
				
				cur.execute("INSERT INTO conferencia (id_publicacao,volume,evento) VALUES (%s,%s,%s)",(id_publicacao,volume,evento))
				
				#cur.execute("INSERT INTO autoria (id_membro,id_publicacao) VALUES (%s,%s)",(id_membro, id_publicacao))

		conn.commit()
		
		novoGrupo.compilarListasDeItems()
		
		novoGrupo.compilador.replicas.sort()
		
		for rep in novoGrupo.compilador.replicas:
			try:
				cur.execute("INSERT INTO replica (id1,id2) VALUES(%s,%s)",(rep[0],rep[1]))
				conn.commit()
			except (psycopg2.IntegrityError):
				conn.rollback()
		
		conn.commit()
		
		for rep in novoGrupo.compilador.replicas:
			cur.execute("SELECT replica FROM publicacao WHERE id_publicacao = "+str(rep[0]))
			rep_pub_1=cur.fetchone()[0]
			if not rep_pub_1:
				cur.execute("UPDATE publicacao SET replica = "+str(rep[0])+" WHERE id_publicacao="+str(rep[0]))
				cur.execute("UPDATE publicacao SET replica = "+str(rep[0])+" WHERE id_publicacao="+str(rep[1]))
			else:
				cur.execute("UPDATE publicacao SET replica = "+str(rep_pub_1)+" WHERE id_publicacao="+str(rep[1]))
		
		conn.commit()
		
		for i,m in enumerate(novoGrupo.listaDeMembros):
			'''
			cur.execute("SELECT replica FROM publicacao WHERE id_membro="+str(i)+" AND replica IS NOT NULL")
			listaReplicas=cur.fetchall()
			for i in range(0,len(listaReplicas)):
				listaReplicas[i]=listaReplicas[i][0]
			'''
			cur.execute("select id_membro from publicacao where replica in (select replica from publicacao where id_membro="+str(i)+" and replica is not null)")
			listaMembrosReplica=cur.fetchall()
			for c in range(0,len(listaMembrosReplica)):
				listaMembrosReplica[c]=listaMembrosReplica[c][0]
				
			
			for c in range(i+1,len(novoGrupo.listaDeMembros)):
				colaboracao=listaMembrosReplica.count(c)
				if colaboracao>0:
					cur.execute("INSERT INTO adjacencia (membro1,membro2,colaboracao) VALUES (%s,%s,%s)",(i,c,colaboracao))
		
		conn.commit()


# ---------------------------------------------------------------------------- #
def compararCadeias(str1, str2):
	str1 = str1.strip().lower()
	str2 = str2.strip().lower()

	if (str1 in str2 or str2 in str1) and len(str1)>10 and len(str2)>10:
		return 1
	else:
		if Levenshtein.ratio(str1, str2)>0.8:
		#if Levenshtein.distance(str1, str2)<5:
			return 1
		else:
			return 0

def criarDiretorio(dir):
	if not os.path.exists(dir):
		try:
			os.makedirs(dir)
		except OSError as exc:
			print "\n[ERRO] Não foi possível criar ou atualizar o diretório: "+dir.encode('utf8')
			print "[ERRO] Você conta com as permissões de escrita? \n"
			return 0
	return 1

def copiarArquivos(dir):
	shutil.copy2(sys.path[0]+'/css/scriptLattes.css', dir)
	shutil.copy2(sys.path[0]+'/imagens/lattesPoint0.png', dir)
	shutil.copy2(sys.path[0]+'/imagens/lattesPoint1.png', dir)
	shutil.copy2(sys.path[0]+'/imagens/lattesPoint2.png', dir)
	shutil.copy2(sys.path[0]+'/imagens/lattesPoint3.png', dir)
	shutil.copy2(sys.path[0]+'/imagens/lattesPoint_shadow.png', dir)
	shutil.copy2(sys.path[0]+'/imagens/usuaria.png', dir)
	shutil.copy2(sys.path[0]+'/imagens/usuario.png', dir)
	shutil.copy2(sys.path[0]+'/imagens/doi.png', dir)
