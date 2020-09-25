#!/usr/bin/env python3

"""
plots a network of the QMEE partner institutes
Author: Your Name"""

__author__ = 'Your Name (your.name@email.address)'
__version__ = '0.0.1'

# imports
import networkx as nx
import pandas as pd
import scipy as sc
import matplotlib.pyplot as plt
import matplotlib.lines as mlines

# read in the data as pandas dataframe
links = pd.read_csv("../data/QMEE_Net_Mat_edges.csv")
nodes = pd.read_csv("../data/QMEE_Net_Mat_nodes.csv")

# have a look
# print(links)
# print(nodes)

################################################################################
# sorting out links
################################################################################

# rows and columns with no 0 i.e. nodes to be linked!!
rows, cols = sc.where(links > 0)

# empty lists
source = []
target = []
weight = []

# tmp matrix so you can reference and pull out weights!
tmp = pd.DataFrame.as_matrix(links)

# append lists with relevant info
for i in range(0, len(cols)):
    source.append(links.columns[cols[i]])
    target.append(links.columns[rows[i]])
    weight.append(tmp[cols[i]][rows[i]])

# join lists to dataframe
df = pd.DataFrame({'source': source, 'target': target, 'weight': weight})
# print(df)

edges = df.loc[:, 'source':'target']
edges = list(edges.apply(tuple, axis=1))

weight = list(df.weight)
wweight = [x/5 for x in weight]


################################################################################
# sorting nodes
################################################################################

# start the nx object!
G = nx.Graph()
# add nodes
G.add_nodes_from(nodes.id)

# initialise empty list for colours
colour_map = []

# iterate through G and appened the appropriate colour to colour_map
# the nodes are in a weird order for G
for i in G:
    if nodes.Type[sc.where(nodes.id == i)[0][0]] == 'University':
        colour_map.append('green')
    elif nodes.Type[sc.where(nodes.id == i)[0][0]] == 'Hosting Partner':
        colour_map.append('red')
    else:
        colour_map.append('blue')


################################################################################
# drawing it
################################################################################

# sets up for legend
line1 = mlines.Line2D(range(1), range(1), color='white',
                      marker='o', markerfacecolor='green')
line2 = mlines.Line2D(range(1), range(1), color='white',
                      marker='o', markerfacecolor='red')
line3 = mlines.Line2D(range(1), range(1), color='white',
                      marker='o', markerfacecolor='blue')


# pos: something about the spacing of the nodes
f = plt.figure()
pos = nx.spring_layout(G, iterations=50)
nx.draw_networkx_edges(G, pos, edgelist=edges, width=wweight)
nx.draw_networkx_nodes(G, pos, node_size=3000, node_color=colour_map)
nx.draw_networkx_labels(G, pos)


plt.axis("off")
plt.draw()

leg = plt.legend((line1, line2, line3),
                 ('University', 'Hosting Partner', 'Non-Hosting Partner'),
                 numpoints=1, loc=1)
leg.get_frame().set_linewidth(0.0)
plt.tight_layout(pad=4)
# plt.show()
f.savefig("../results/Nets_py_figure.svg", dpi=200)
