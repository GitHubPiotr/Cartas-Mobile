extends Node2D

var slots

var armour = 25

func _ready():
	slots = 1
	$Panel/VBoxContainer/Name.text = "Armour2"
	$Panel/VBoxContainer/Stats.text = "Def: " + str(armour)
	$Panel/VBoxContainer/Bonus.text = "Empty"
