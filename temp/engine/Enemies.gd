extends Node

var enemy
var enemy_preloaded
var current_enemy
var amount

var player
var combat_mechanism
var enemy_health_bar

signal respawn_enemy
signal kill_enemy

func _init():
	current_enemy = 0

func _ready():
	Game.ADD_NODE_TO_REFERENCE_LIST(self)
	connect("respawn_enemy", self, "_respawn_enemy")
	connect("kill_enemy", self, "_kill_enemy")

func init(enemy_preloaded, amount):
	self.enemy_preloaded = enemy_preloaded
	self.amount = amount
	emit_signal("respawn_enemy")

func _respawn_enemy():
	enemy = enemy_preloaded.instance()
	add_child(enemy)
	enemy.global_position = Vector2(175, 125)
	
	player = Game.GET_NODE_FROM_REFERENCE_LIST("Player")
	combat_mechanism = Game.GET_NODE_FROM_REFERENCE_LIST("CombatMechanism")
	enemy_health_bar = Game.GET_NODE_FROM_REFERENCE_LIST("EnemyHealthBar")
	
	combat_mechanism.init(player, enemy)
	enemy_health_bar.init()

func _kill_enemy():
	enemy.queue_free()
	current_enemy += 1
	if current_enemy == amount:
		print("All enemies has been killed!")
		return
	emit_signal("respawn_enemy")
