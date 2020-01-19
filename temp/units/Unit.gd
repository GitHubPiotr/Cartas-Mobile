extends Node2D

var level
var experience
var cooldown

var health
var mana
var condition

var damage
var fixed_damage
var critical_chance
var evasion_chance
var armour
var speed

signal reset_cooldown
signal attack

func _ready():
	Game.ADD_NODE_TO_REFERENCE_LIST(self)
	connect("reset_cooldown", self, "_reset_cooldown")
	connect("attack", self, "_attack")

func _reset_cooldown():
	cooldown = Game.COOLDOWN

func _attack(target):
	# damage have to be greather than 0(except miss)
	if damage == 0: damage = 5
	# damage gap (10%)
	fixed_damage = int(damage * 0.9 + randi()%damage * 0.2)
	# chance to critacal hit
	var chance = randi()%100
	if chance < critical_chance: fixed_damage *= 2
	# chance to miss the target
	chance = randi()%100
	if chance < target.evasion_chance: fixed_damage = 0
	# attack
	$Sprite/Animation.queue("attack")
	target._take_damage(fixed_damage)
	# debug
	print("[", self.name,"]", " is attacking ", "[", target.name, "]", " for ", self.fixed_damage, " damage.")

func _take_damage(fixed_damage):
	health -= fixed_damage
	$Sprite/Animation.queue("take_damage")
