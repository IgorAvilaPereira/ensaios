class Pessoa(object):
	
	def __init__(self, nome):
		self.nome = nome

	
	def imprime(self):
		print self.nome


class PessoaFisica(Pessoa):

	def __init__(self, cpf, nome):
		Pessoa.__init__(self, nome)
		self.cpf = cpf

	def imprime(self):
		Pessoa.imprime(self)
		print self.cpf




pessoaFisica = PessoaFisica("cpf", "igor")
pessoaFisica.imprime()


from abc import ABCMeta, abstractmethod

class Animal:
    __metaclass__ = ABCMeta

    @abstractmethod
    def say_something(self): pass

class Cat(Animal):

    """
    def say_something(self):
        return "Miauuu!"
	"""

# dah erro pq uma classe abstrata nao pode ser instanciada.
#a = Animal()
# sem o metodo abstrato  - dah erro.
a = Cat()