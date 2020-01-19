extends Node

const GAMNE_WIDTH = 123
const GAMNE_HEIGHT = 123

const COOLDOWN = 1000

func ADD_NODE_TO_REFERENCE_LIST(node):
	var level_node = get_tree().get_root().get_node("Level")
	level_node.add_node_reference(node)

func GET_NODE_FROM_REFERENCE_LIST(name):
	var level_node = get_tree().get_root().get_node("Level")
	return level_node.get_node_reference(name)
