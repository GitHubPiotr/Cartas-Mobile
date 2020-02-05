extends "res://units/Unit.gd"

func _ready():
	Game.GET_NODE_FROM_REFERENCE_LIST("HealthBar").init(self)

func init(level, experience, health, mana, condition, damage, 
	critical_chance, evasion_chance, armour, speed, lifesteal):
		stats.level = level
		stats.experience = experience
		stats.health = health
		stats.mana = mana
		stats.condition = condition
		stats.damage = damage
		stats.critical_chance = critical_chance
		stats.evasion_chance = evasion_chance
		stats.armour = armour
		stats.speed = speed
		stats.lifesteal = lifesteal
		max_health = stats.health
		cooldown = Game.COOLDOWN

func _attack(target):
	._attack(target)
	change_condition()
	if fixed_damage == 0: fixed_damage = "miss"
	$Info/Attack.show_damage(fixed_damage)

func _take_damage(fixed_damage):
	._take_damage(fixed_damage)
	$Info/TakeDamage.show_take_damage(fixed_damage)
	Game.GET_NODE_FROM_REFERENCE_LIST("HealthBar").emit_signal("set_health", stats.health)

func _heal(lifesteal_value):
	._heal(lifesteal_value)
	$Info/Heal.show_heal(lifesteal_value)
	Game.GET_NODE_FROM_REFERENCE_LIST("HealthBar").emit_signal("set_health", stats.health)

func change_condition():
	stats.condition -= 1
	if stats.condition <= 0:
		print("condition")
