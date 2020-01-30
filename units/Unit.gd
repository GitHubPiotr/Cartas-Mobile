extends Node2D

var stats = {
	level = 1, experience = 0,
	health = 1, mana = 0, condition = 0, 
	damage = 0, armour = 0, speed = 0,
	critical_chance = 0, evasion_chance = 0, lifesteal = 0
}

var cooldown
var fixed_damage
var max_health

signal reset_cooldown
signal attack

func _ready():
	max_health = stats.health
	connect("reset_cooldown", self, "_reset_cooldown")
	connect("attack", self, "_attack")

func _reset_cooldown():
	cooldown = Game.COOLDOWN

func _attack(target):
	# damage have to be greather than 0
	if stats.damage == 0: stats.damage = 5
	# damage gap (10%)
	fixed_damage = int(stats.damage* 0.9 + randi()%stats.damage * 0.2)
	# chance to critacal hit
	var chance = 0
	chance = randf()*1.0
	if chance < stats.critical_chance: fixed_damage *= 2
	# chance to miss target attack
	chance = randf()*1.0
	if chance < target.stats.evasion_chance: fixed_damage = 0
	# attack
	$Sprite/Animation.queue("attack")
	target._take_damage(fixed_damage)
	# lifesteal
	var lifesteal_value = int(stats.lifesteal * fixed_damage)
	self._heal(lifesteal_value)
	# debug
	print("[", self.name,"]", " is attacking ", "[", target.name, "]", " for ", self.fixed_damage, " damage.")

func _take_damage(fixed_damage):
	stats.health -= fixed_damage
	$Sprite/Animation.queue("take_damage")

func _heal(lifesteal_value):
	stats.health += lifesteal_value
	if stats.health > max_health:
		stats.health = max_health

func set_stats(level, experience, health, mana, condition, damage, 
	critical_chance, evasion_chance, armour, speed, lifesteal):
		
		stats.level = level
		stats.experience = experience
		stats.health = health
		stats.mana = mana
		stats.condition = condition
		stats.damage = damage
		stats.evasion_chance = evasion_chance
		stats.armour = armour
		stats.speed = speed
		stats.lifesteal = lifesteal
