extends Node

onready var Armour1 = preload("res://items/armours/armour1/Armour1.tscn")

var player_item_list = []

func _ready():
	#load_form_file
	add_item(Armour1)
	pass

func add_item(item):
	player_item_list.append(item)

func remove_item(item):
	player_item_list.erase(item)

func get_all_items():
	return player_item_list
