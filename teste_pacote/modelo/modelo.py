
class Aniversariante:

	def __init__(self, cpf, nome, idade, mes):
		self.cpf = cpf
		self.nome = nome
		self.idade = idade
		self.mes = mes

	def obj2CSV(self):
		return self.cpf + ";"+ self.nome + ";" + str(self.idade) + ";" + str(self.mes) + ";\n"

	def csv2OBJ(self, linha):
		aux = linha.strip().split(";")
		return Aniversariante(aux[0], aux[1], int(aux[2]), int(aux[3]))

	def __repr__(self):
		return self.nome