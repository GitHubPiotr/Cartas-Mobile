extends Node

const GAMNE_WIDTH = 123
const GAMNE_HEIGHT = 123

const COOLDOWN = 1000

var node_references

func _init():
	node_references = []

func ADD_NODE_TO_REFERENCE_LIST(node):
	node_references.append(node)
	print("Node [", node.name, "] added to reference list")

func REMOVE_NODE_FROM_REFERENCE_LIST(node):
	if not node_references.erase(node):
		print("Cannot remove node. Node [", node.name, "] not found")

func GET_NODE_FROM_REFERENCE_LIST(name):
	for node in node_references:
		if node.name == name: return node
	print("Cannot get node. Reference [", name, "] not found")
