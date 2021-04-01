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

sys.path.append('scriptLattes')
sys.path.append('scriptLattes/producoesBibliograficas/')
sys.path.append('scriptLattes/producoesTecnicas/')
sys.path.append('scriptLattes/producoesArtisticas/')
sys.path.append('scriptLattes/producoesUnitarias/')
sys.path.append('scriptLattes/orientacoes/')
sys.path.append('scriptLattes/eventos/')
sys.path.append('scriptLattes/charts/')

from grupo import *

if __name__ == "__main__":
	arquivoConfiguracao = sys.argv[1]

	novoGrupo = Grupo(arquivoConfiguracao)
	novoGrupo.imprimirListaDeParametros()
	novoGrupo.imprimirListaDeRotulos()

	if criarDiretorio(novoGrupo.obterParametro('global-diretorio_de_saida')):
		novoGrupo.carregarDadosCVLattes() #obrigatorio
		novoGrupo.compilarListasDeItems() # obrigatorio
		novoGrupo.imprimirMatrizesDeFrequencia() 

		novoGrupo.gerarGrafosDeColaboracoes() # obrigatorio
		print "[ROTULOS]"
		print "- "+str(novoGrupo.listaDeRotulos)
		print "- "+str(novoGrupo.listaDeRotulosCores)

		novoGrupo.gerarGraficosDeBarras() # obrigatorio
		novoGrupo.gerarMapaDeGeolocalizacao() # obrigatorio
		novoGrupo.gerarPaginasWeb() # obrigatorio

		# copiar imagens e css
		copiarArquivos(novoGrupo.obterParametro('global-diretorio_de_saida'))

		# finalizando o processo
		print '\n[AVISO] scriptLattes executado!'
		#print '[AVISO] sorria, seu CV Lattes pode estar sendo compilado :-)'
		print '[AVISO] Quem vê \'lattes\', não vê coração! :-D'
		print '[AVISO] Visite a página: http://scriptlattes.sourceforge.net\n'

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
