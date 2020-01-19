extends "res://units/Unit.gd"

func _ready():
	level = 1
	experience = 0
	cooldown = Game.COOLDOWN
	health = 1000
	mana = 50
	damage = 55
	armour = 1
	speed = 200
	critical_chance = 35
	evasion_chance = 30

func _attack(target):
	._attack(target)
	if fixed_damage == 0: fixed_damage = "miss"
	$AttackInfo.show_damage(fixed_damage)

func _take_damage(fixed_damage):
	._take_damage(fixed_damage)
	$TakeDamageInfo.show_take_damage(fixed_damage)
	Game.GET_NODE_FROM_REFERENCE_LIST("HealthBar").emit_signal("set_health", health)
