
arquivo = open("grafo.xml",'w')
s ='<?xml version="1.0" encoding="UTF-8"?> \
	\n<graphml xmlns="http://graphml.graphdrawing.org/xmlns"> \
	\n<graph edgedefault="undirected"> \
	\n<!-- data schema --> \
	\n<key id="id_membro" for="node" attr.name="id_membro" attr.type="int"/>
	\n<key id="name" for="node" attr.name="name" attr.type="string"/> \
	\n<key id="link" for="node" attr.name="link" attr.type="string"/> \
	\n<key id="pubs" for="node" attr.name="pubs" attr.type="int"/>'