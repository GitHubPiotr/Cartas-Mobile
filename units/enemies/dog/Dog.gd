extends "res://units/Unit.gd"

func _ready():
	stats.health = 700
	stats.damage = 100
	stats.evasion_chance = 0.15
	stats.armour = 10
	stats.speed = 125
	stats.lifesteal = 0.05
	cooldown = Game.COOLDOWN
	Game.GET_NODE_FROM_REFERENCE_LIST("EnemyHealthBar").init(self)

func _take_damage(fixed_damage):
	._take_damage(fixed_damage)
	Game.GET_NODE_FROM_REFERENCE_LIST("EnemyHealthBar").emit_signal("set_health", stats.health)
