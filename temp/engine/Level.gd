extends Node

const Enemy1 = preload("res://units/enemies/dog/Enemy.tscn")

var node_references

func _init():
	node_references = []

func _ready():
	var player = $PanelLayout/CombatPanel/PlayerPanel/Player
	var enemies_node = $PanelLayout/CombatPanel/EnemyPanel/Enemies
	var combat_mechanism = $CombatMechanism
	
	enemies_node.init(Enemy1, 3)
	combat_mechanism.init(player, enemies_node.enemy)

func add_node_reference(node_reference):
	node_references.append(node_reference)
	print("Node [", node_reference.name, "] added to reference list")

func get_node_reference(name):
	for node in node_references:
		if name == node.name: return node
	print("Reference [", name, "] not found")
