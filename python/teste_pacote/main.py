import sys
import os
from persistencia.persistencia import *
from modelo.modelo import *

# main
if __name__ == '__main__':
	#arquivo = open("banco.txt", "w")
	#arquivo.close()

	aniversarianteDAO = AniversarianteDAO()
	#aniversarianteDAO.adicionar(Aniversariante("888","Igor", 31, 1))
	#aniversarianteDAO.adicionar(Aniversariante("190","beck love", 19, 5))
	"""
	vet = aniversarianteDAO.listar()
	for n in vet:
		print n.nome
"""
	#print "Excluindo beck"
	#aniversarianteDAO.excluir("777")
	#vet = aniversarianteDAO.listar()
	#for n in vet:
	#	print n.nome
	'''
	aniversariante = aniversarianteDAO.obter("190")
	aniversariante.nome = "Vinicius Beck"
	aniversarianteDAO.editar(aniversariante)
	'''
	#aniversarianteDAO.redirecionar()
	#aniversarianteDAO.adicionar(Aniversariante("222","ana", 40, 1))
	#aniversarianteDAO.redirecionar()

	aniversarianteDAO.gravarOrdemAlfabetica()



