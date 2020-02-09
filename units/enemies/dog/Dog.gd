extends "res://units/Unit.gd"

func _ready():
	stats.health = 700
	stats.damage = 100
	stats.evasion_chance = 0.15
	stats.armour = 10
	stats.speed = 125
	stats.lifesteal = 0.05
	cooldown = Game.COOLDOWN
	max_health = stats.health
	Game.GET_NODE("EnemyHealthBar").init(self)

func _take_damage(fixed_damage):
	._take_damage(fixed_damage)
	Game.GET_NODE("EnemyHealthBar").emit_signal("set_health", stats.health)
	if stats.health <= 0: kill_enemy()

func kill_enemy():
	Game.GET_NODE("CombatMechanism").emit_signal("kill_enemy")
