from modelo.modelo import *
import os

class AniversarianteDAO:

	def obter(self, cpf):
		vet = self.listar()
		for aniversariante in vet:
			if (aniversariante.cpf == cpf):
				return aniversariante			

	def listar(self):
		arquivo = open("banco.txt", "r")
		vet = []
		for linha in arquivo:
			aux = linha.strip().split(";")
			aniversariante = Aniversariante(aux[0], aux[1], int(aux[2]), int(aux[3]))
			vet.append(aniversariante)
		arquivo.close()
		return vet

	def listarMes(self,mes):
		vet = self.listar()
		for n in vet:
			if n.mes == mes: 
				print n.nome

	def adicionar(self, aniversariante):
		arquivo = open("banco.txt", "a")
		arquivo.write(aniversariante.obj2CSV())
		arquivo.close()

	def excluir(self, cpf):
		vet = self.listar()
		vetAux = []
		for aniversariante in vet:
			if (aniversariante.cpf != cpf):
				vetAux.append(aniversariante)

		arquivo = open("banco.txt", "w")
		arquivo.close()		
		for e in vetAux:
			self.adicionar(e)

	def editar(self, aniversariante):
		vet = self.listar()
		vetAux = []
		for aniversarianteAux in vet:
			if (aniversarianteAux.cpf == aniversariante.cpf):
				vetAux.append(aniversariante)
			else:
				vetAux.append(aniversarianteAux)			

		arquivo = open("banco.txt", "w")
		arquivo.close()		
		for e in vetAux:
			self.adicionar(e)
			
	def gravarOrdemAlfabetica(self):
		vet = self.listar()
		vetNome = []
		for x in vet:
			vetNome.append(x.nome.upper())
		vetNome.sort()
		
		arquivo = open("ordem.txt", "a+")		
		for nome in vetNome:
			arquivo.write(nome+"\n")
		arquivo.close()

	def redirecionar(self):
		meses = ["","janeiro","fevereiro","marco","abril","maio","junho","julho","agosto","setembro","outubro","novembro","dezembro"]
		qtdePorMes = [0,0,0,0,0,0,0,0,0,0,0,0]
		vet = self.listar()

		for m in meses:
			arquivo = open(m+".txt","w")
			arquivo.close()
		
		for n in vet:
			qtdePorMes[n.mes] = qtdePorMes[n.mes] + 1
			arquivo = open(meses[n.mes]+".txt","a")
			arquivo.write(n.obj2CSV())
			arquivo.close()

		i = 0
		while i < len(qtdePorMes):
			if (qtdePorMes[i] == 0):
				os.remove(meses[i]+".txt")
			i = i + 1