#!/usr/bin/python
# encoding: utf-8
# filename: analisadorDePublicacoes.py
#
#  scriptLattes V8
#  Copyright 2005-2012: Jesús P. Mena-Chalco e Roberto M. Cesar-Jr.
#  http://scriptlattes.sourceforge.net/
#
#
#  Este programa é um software livre; você pode redistribui-lo e/ou 
#  modifica-lo dentro dos termos da Licença Pública Geral GNU como 
#  publicada pela Fundação do Software Livre (FSF); na versão 2 da 
#  Licença, ou (na sua opinião) qualquer versão.
#
#  Este programa é distribuído na esperança que possa ser util, 
#  mas SEM NENHUMA GARANTIA; sem uma garantia implicita de ADEQUAÇÂO a qualquer
#  MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
#  Licença Pública Geral GNU para maiores detalhes.
#
#  Você deve ter recebido uma cópia da Licença Pública Geral GNU
#  junto com este programa, se não, escreva para a Fundação do Software
#  Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#


import string
import re
import urllib2
import cookielib
import time
import HTMLParser
from tidylib import tidy_document
from publicacaoEinternacionalizacao import * 

class AnalisadorDePublicacoes:
	grupo = None
	paises = None
	listaDePublicacoesEinternacionalizacao = None

	def __init__(self, grupo):
		self.grupo = grupo
		self.listaDePublicacoesEinternacionalizacao = {}
		self.paises = {
			"Abkhazia":       ["Apsny", "Abkhaziya"],
			"Afghanistan":    ["Afghanestan"],
			"Albania":        ["Shqipëria"],
			"Algeria":        ["Al-Jazā'ir"],
			"American Samoa": ["Amerika Sāmoa"],
			"Andorra":        [],
			"Angola":         [],
			"Anguilla":       [],
			"Antigua and Barbuda": [],
			"Argentina":      [],
			"Armenia":        ["Hayastán"],
			"Aruba":          [],
			"Australia":      [],
			"Austria":        ["Österreich"],
			"Azerbaijan":     ["Azərbaycan"],
			"The Bahamas":    ["Bahamas"],
			"Bahrain":        ["Al-Baḥrayn"],
			"Bangladesh":     [],
			"Barbados":       [],
			"Belarus":        ["Belorussiya", "Belorussiâ"],
			"Belgium":        ["België", "Belgique", "Belgien"],
			"Belize":         [],
			"Benin":          ["Bénin"],
			"Bermuda":        [],
			"Bhutan":         ["Druk Yul"],
			"Bolivia":        ["Volívia"],
			"Bosnia and Herzegovina": ["Bosna i Hercegovina"],
			"Botswana":       [],
			"Brazil":         ["Brasil"],
			"Brunei":         [],
			"Bulgaria":       ["Bulgariya", "Bălgarija"],
			"Burkina Faso":   [],
			"Burma":          ["Myanmar"],
			"Burundi":        [],
			"Cambodia":       ["Kampuchea"],
			"Cameroon":       ["Cameroun"],
			"Canada":         [],
			"Cape Verde":     ["Cabo Verde"],
			"Cayman Islands": [],
			"Central African Republic" : ["République Centrafricaine"],
			"Chad":           ["Tchad"],
			"Chile":          [],
			"China":          [],
			"Christmas Island": [],
			"Cocos Islands":  [],
			"Colombia":       [],
			"Comoros":        ["Komori", "Comores"],
			"Congo":          [],
			"Cook Islands":   [],
			"Costa Rica":     [],
			"Cote dIvoire":   ["Côte d'Ivoire", "Cote d'Ivoire"],
			"Croatia":        ["Hrvatska"],
			"Cuba":           [],
			"Cyprus":         ["Kypros"],
			"Czech Republic": ["Česká republika", "Česko"],
			"Denmark":        ["Danmark"],
			"Djibouti":       ["Jībūtī"],
			"Dominica":       [],
			"Dominican Republic": ["República Dominicana", "Republica Dominicana"],
			"East Timor":     ["Timor Lorosa'e", "Timor-Leste"],
			"Ecuador":        [],
			"Egypt":          [],
			"El Salvador":    [],
			"Equatorial Guinea": ["Guinea Ecuatorial"],
			"Eritrea":        ["Iritriya"],
			"Estonia":        ["Eesti"],
			"Ethiopia":       ["Ityop'ia", "Ityopia"],
			"Faroe Islands":  [],
			"Fiji":           ["Viti"],
			"Finland":        ["Suomi"],
			"France":         [],
			"French Guiana":  ["Guyane"],
			"French Polynesia": ["Polynésie française"],
			"Gabon":          [],
			"The Gambia":     [],
			"Georgia":        ["Sak'art'velo"],
			"Germany":        ["Deutschland"],
			"Ghana":          [],
			"Gibraltar":      [],
			"Greece":         ["Hellas", "Ellada"],
			"Greenland":      ["Kalaallit Nunaat"],
			"Grenada":        [],
			"Guadeloupe":     [],
			"Guam":           [],
			"Guatemala":      [],
			"Guernsey":       [],
			"Guinea":         ["Guinée"],
			"Guinea-Bissau":  ["Guiné-Bissau"],
			"Guyana":         [],
			"Haiti":          ["Haïti", "Ayiti"],
			"Honduras":       [],
			"Hungary":        ["Magyarország"],
			"Iceland":        ["Ísland"],
			"India":          ["Bhārat"],
			"Indonesia":      [],
			"Iran":           ["Īrān"],
			"Iraq":           ["Al-'Iraq"],
			"Ireland":        ["Éire"],
			"Isle of Man":    ["Ellan Vannin"],
			"Israel":         ["Yisrael"],
			"Italy":          ["Italia"],
			"Jamaica":        [],
			"Japan":          ["Nippon", "Nihon"],
			"Jersey":         ["Jèrri"],
			"Jordan":         ["Al-’Urdun"],
			"Kazakhstan":     ["Qazaqstan", "Kazakhstán"],
			"Kenya":          [],
			"Kiribati":       [],
			"South Korea":    [],
			"North Korea":    [],
			"Kosovo":         ["Kosova", "Косово"],
			"Kuwait":         ["Al-Kuwayt"],
			"Kyrgyzstan":     ["Kirgizija"],
			"Laos":           ["Lao"],
			"Latvia":         ["Latvija"],
			"Lebanon":        ["Lubnān"],
			"Lesotho":        [],
			"Liberia":        [],
			"Libya":          ["Lībiyā"],
			"Liechtenstein":  [],
			"Lithuania":      ["Lietuva"],
			"Luxembourg":     ["Lëtzebuerg", "Luxembourg"],
			"Macedonia":      ["Makedonija"],
			"Madagascar":     ["Madagasikara"],
			"Malawi":         [],
			"Malaysia":       [],
			"Maldives":       ["Dhivehi Raajje"],
			"Mali":           [],
			"Malta":          [],
			"Marshall Islands": [],
			"Martinique":     [],
			"Mauritania":     ["Mauritanie"],
			"Mauritius":      [],
			"Mayotte":        [],
			"Mexico":         ["México"],
			"Federated States of Micronesia": [],
			"Moldova":        [],
			"Monaco":         [],
			"Mongolia":       [],
			"Montenegro":     ["Crna Gora"],
			"Montserrat":     [],
			"Morocco":        ["Al-Maghrib"],
			"Mozambique":     ["Moçambique"],
			"Namibia":        [],
			"Nauru":          ["Naoero", "Nauruo"],
			"Nepal":          ["Nepāla"],
			"Netherlands":    ["Nederland"],
			"New Caledonia":  ["Nouvelle-Calédonie"],
			"New Zealand":    ["Aotearoa"],
			"Nicaragua":      [],
			"Niger":          [],
			"Nigeria":        [],
			"Niue":           [],
			"Norfolk Island": [],
			"Northern Ireland": [],
			"Northern Mariana Islands": [],
			"Norway":         ["Norge", "Noreg"],
			"Oman":           [],
			"Pakistan":       [],
			"Palau":          ["Belau"],
			"Palestinian National Authority": ["Filastīn"],
			"Panama":         ["Panamá"],
			"Papua New Guinea": ["Papua Niugini"],
			"Paraguay":       ["Paraguái"],
			"Peru":           ["Perú"],
			"Philippines":    ["Pilipinas", "Filipinas"],
			"Pitcairn Islands": [],
			"Poland":         ["Polska"],
			"Portugal":       [],
			"Puerto Rico":    [],
			"Qatar":          [],
			"Reunion":        ["Réunion"],
			"Romania":        ["România"],
			"Russia":         ["Rossiya", "Rossiâ"],
			"Rwanda":         [],
			"Saint-Pierre and Miquelon": ["Saint-Pierre et Miquelon"],
			"Saint Helena":   [],
			"Saint Kitts and Nevis": [],
			"Saint Lucia":    [],
			"Saint Vincent and the Grenadines": [],
			"Samoa":          [],
			"San Marino":     [],
			"Sao Tome and Principe": ["São Tomé and Príncipe", "São Tomé e Príncipe"],
			"Saudi Arabia":   [],
			"Senegal":        ["Sénégal"],
			"Serbia":         ["Srbija"],
			"Seychelles":     ["Sesel"],
			"Sierra Leone":   [],
			"Singapore":      ["Singapura", "Singapur"],
			"Slovakia":       ["Slovensko"],
			"Slovenia":       ["Slovenija"],
			"Solomon Islands": [],
			"Somalia":        ["Soomaaliya"],
			"South Africa":   ["Suid-Afrika"],
			"South Sudan":    [],
			"South Ossetia":  ["Khussar Iryston"],
			"Spain":          ["España", "Espanya", "Espainia", "Espanha"],
			"Sri Lanka":      ["Sri Lankā"],
			"Sudan":          ["As-Sudan"],
			"Suriname":       [],
			"Svalbard":       [],
			"Swaziland":      [],
			"Sweden":         ["Sverige"],
			"Switzerland":    ["Schweiz", "Suisse", "Svizzera", "Svizra"],
			"Syria":          ["Suriyah"],
			"Taiwan":         [],
			"Tajikistan":     ["Tojikistan"],
			"Tanzania":       [],
			"Thailand":       ["Mueang Thai"],
			"Togo":           [],
			"Tokelau":        [],
			"Tonga":          [],
			"Trinidad and Tobago": [],
			"Tunisia":        ["Tunis"],
			"Turkey":         ["Türkiye"],
			"Turkish Republic of Northern Cyprus": [],
			"Turkmenistan":   ["Türkmenistan"],
			"Turks and Caicos Islands": [],
			"Tuvalu":         [],
			"Uganda":         [],
			"Ukraine":        ["Ukraїna"],
			"United Arab Emirates": ["UAE", "The Emirates"],
			"United Kingdom": ["UK", "Britain"],
			"United States":  ["USA", "America", "US", "U.S.", "USA", "Estados Unidos", "América"],
			"Uruguay":        ["República Oriental del Uruguay"],
			"Uzbekistan":     ["O'zbekiston", "Ozbekiston"],
			"Vanuatu":        [],
			"Vatican City":   ["Civitas Vaticana", "Vatican", "vaticano"],
			"Venezuela":      [],
			"Vietnam":        [],
			"Virgin Islands": [],
			"Vojvodina":      ["Vojvodyna"],
			"Wallis and Futuna": ["Wallis-et-Futuna", "Wallis et Futuna"],
			"Yemen":          ["Al-Yaman"],
			"Zambia":         [],
			"Zimbabwe":       [],
		}   		

	def analisarInternacionalizacaoNaCoautoria(self):
		listaCompletaPB = self.grupo.compilador.listaCompletaPB

		keys = listaCompletaPB.keys()
		for ano in keys:
			elementos = listaCompletaPB[ano]
			for index in range(0, len(elementos)):
				pub = elementos[index]
				if hasattr(pub, 'doi'):
					if not pub.doi=="":
						listaDePaisesIdentificados = self.identificarPaisesEmPublicacao(pub.doi)
						publicacaoEinternacionalizacao = PublicacaoEinternacionalizacao(pub)
						publicacaoEinternacionalizacao.atribuirListaDeIndicesDePaises(listaDePaisesIdentificados)

						if self.listaDePublicacoesEinternacionalizacao.get(pub.ano)==None:
							self.listaDePublicacoesEinternacionalizacao[pub.ano] = []
						self.listaDePublicacoesEinternacionalizacao[pub.ano].append(publicacaoEinternacionalizacao)

		# devolve uma lista com as publicacoes e paises
		return self.listaDePublicacoesEinternacionalizacao


	def identificarPaisesEmPublicacao(self, urlDOI):
		#print "------------------------------------------==========================================================================================="
		#print "------------------------------------------==========================================================================================="
		#print urlDOI

		listaDePaisesIdentificados = None
		doihtml = self.obterDadosAtravesDeDOI(urlDOI)
		

		if doihtml is not None:	
			doihtml = doihtml.encode('utf8','replace')
			#print "------------------------------------------==========================================================================================="
			#print doihtml

			doihtml = doihtml.lower()
			#prefixo = ",\s*"
			prefixo = ",.*,\s*"
			listaDePaisesIdentificados = []

			for key in self.paises.keys():
				nomeDePais = key
				# Procuramos o nome em ingles (nome original)
				if self.procurarPais(doihtml, nomeDePais, prefixo):
					listaDePaisesIdentificados.append(nomeDePais)
				else:
					if len(self.paises[nomeDePais])>0:
						# Procuramos os nomes alternativos dos países
						for nomeAlternativoDePais in self.paises[nomeDePais]:
							if self.procurarPais(doihtml, nomeAlternativoDePais, prefixo):
								listaDePaisesIdentificados.append(nomeDePais)
								break

		print "Paises identificados : " + str(listaDePaisesIdentificados)

		# print "------------------------------------------==========================================================================================="
		# print listaDePaisesIdentificados
		# print "------------------------------------------==========================================================================================="
		# print "------------------------------------------==========================================================================================="
	
		return listaDePaisesIdentificados
	

	def procurarPais(self, doihtml, nomeDePais, prefixo):
		nomeDePais = nomeDePais.lower()
		if re.search(prefixo+re.escape(nomeDePais)+r"\s*\n", doihtml):
			return True
		if re.search(prefixo+re.escape(nomeDePais)+r"\W*\n", doihtml):
			return True
		#if re.search(prefixo+re.escape(nomeDePais)+r"\b", doihtml):
		#	return True
		return False


	def obterDadosAtravesDeDOI(self, urlDOI):
		print '\nProcessando DOI: ' + urlDOI
		txdata = None
		txheaders = {   
		'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:2.0) Gecko/20100101 Firefox/4.0',
		'Accept-Language': 'en-us,en;q=0.5',
		'Accept-Encoding': 'deflate',
		'Keep-Alive': '115',
		'Connection': 'keep-alive',
		'Cache-Control': 'max-age=0',
		}

		# tentamos 3 vezes baixar a página web associado ao DOI
		tentativa = 1
		while tentativa<=1:
			try:
				req = urllib2.Request(urlDOI, txdata, txheaders)

				cj = cookielib.CookieJar()
				opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))
				response = opener.open(req)
				rawDOIhtml = response.read()
				break
			except:
				print '[AVISO] Tentativa '+str(tentativa)+': DOI não identificado corretamente: ', urlDOI
				time.sleep(100)
				rawDOIhtml = None
				tentativa += 1
				continue

		if rawDOIhtml is not None:
			print "***************************************************"
			print type(rawDOIhtml)
			print type(rawDOIhtml.decode("utf8", "ignore"))

			rawDOIhtml = HTMLParser.HTMLParser().unescape(rawDOIhtml.decode("utf8", "ignore"))

			doihtml =  self.html2texto(rawDOIhtml)

		else:
			doihtml = rawDOIhtml

		return doihtml


	def html2texto(self, rawDOIhtml):
		# First we remove inline JavaScript/CSS:
		cleaned = re.sub(r"(?is)<(script|style).*?>.*?(</\1>)", "", rawDOIhtml.strip())
		# Then we remove html comments. This has to be done before removing regular
		# tags since comments can contain '>' characters.
		cleaned = re.sub(r"(?s)<!--(.*?)-->[\n]?", "", cleaned)
		
		cleaned = re.sub(r"<br>", "\n", cleaned)
		cleaned = re.sub(r"(?s)<p.*?>", "\n", cleaned)
		cleaned = re.sub(r"(?s)<li.*?>", "\n", cleaned)
		cleaned = re.sub(r"(?s)<div.*?>", "\n", cleaned)
		cleaned = re.sub(r"\r", "\n", cleaned)
		cleaned = re.sub(r"\t+", " ", cleaned)
		
		#cleaned = re.sub(r"\"", "", cleaned) # novo
		
		# Next we can remove the remaining tags:
		cleaned = re.sub(r"(?s)<.*?>", " ", cleaned)
		# Finally, we deal with whitespace
		##cleaned = re.sub(r"&nbsp;", " ", cleaned)
		##cleaned = re.sub(r"  ", " ", cleaned)
		##cleaned = re.sub(r"  ", " ", cleaned)

		cleaned = re.sub(r"\s+\n", "\n", cleaned)

		return cleaned.strip()
