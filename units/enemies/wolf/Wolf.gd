extends "res://units/Unit.gd"

func _ready():
	level = 1
	experience = 0
	cooldown = Game.COOLDOWN
	health = 1000
	mana = 25
	damage = 100
	armour = 0
	speed = 150
	critical_chance = 10
	evasion_chance = 35

func _take_damage(fixed_damage):
	._take_damage(fixed_damage)
	Game.GET_NODE_FROM_REFERENCE_LIST("EnemyHealthBar").emit_signal("set_health", health)
