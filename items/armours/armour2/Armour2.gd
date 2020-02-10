extends Node2D

var slots

var armour = 10

func _ready():
	slots = 1
	$Panel/VBoxContainer/Stats.text = "Def: " + str(armour)
