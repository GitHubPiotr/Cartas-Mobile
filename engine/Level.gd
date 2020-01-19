extends Node

const CombatMechanism = preload("res://engine/CombatMechanism.tscn")
const Player = preload("res://units/player/Player.tscn")
const Dog = preload("res://units/enemies/dog/Dog.tscn")

var node_references

func _init():
	node_references = []

func _ready():
	var panel_layout = $PanelLayout
	
	var player = Player.instance()
	player.init(1, 1, 1001, 50, 100, 222, 0.10, 0.10, 10, 200, 0.1)
	player.global_position = Vector2(225, 375)
	add_child(player)
	
	var combat_mechanism = CombatMechanism.instance()
	combat_mechanism.init(player, Dog, 2)
	add_child(combat_mechanism)
