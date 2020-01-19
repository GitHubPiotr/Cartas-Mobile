extends Node

var player
var enemy
var units

var amount
var current_enemy
var enemy_preloaded

var combat_started

signal respawn_enemy
signal kill_enemy

func _init():
	current_enemy = 0
	amount = 0

func _ready():
	Game.ADD_NODE_TO_REFERENCE_LIST(self)
	connect("respawn_enemy", self, "_respawn_enemy")
	connect("kill_enemy", self, "_kill_enemy")
	emit_signal("respawn_enemy")
	$TickRate.start()

func init(player, enemy_preloaded, amount):
	self.player = player
	self.enemy_preloaded = enemy_preloaded
	self.amount = amount

func _process(delta):
	if not combat_started: return
	# set current unit in order(by cooldown)
	var current_unit = null
	for unit in units:
		if unit.cooldown >= 0: continue
		current_unit = unit
	# check if some unit is ready:
	if current_unit != null:
		# set target(working with groups)
		var target = enemy if current_unit == player else player
		# do something with unit
		current_unit.emit_signal("attack", target)
		# reset cooldown for unit
		current_unit.emit_signal("reset_cooldown")

# tick rate mechanism
func _on_TickRate_timeout():
	for unit in units:
		unit.cooldown -= unit.stats.speed

func _respawn_enemy():
	enemy = enemy_preloaded.instance()
	add_child(enemy, true)
	units = [player, enemy]
	enemy.global_position = Vector2(175, 125)
	combat_started = true

func _kill_enemy():
	enemy.queue_free()
	units.erase(enemy)
	combat_started = false
	if current_enemy == amount-1:
		print("All enemies has been killed!")
		return
	current_enemy += 1
	emit_signal("respawn_enemy")
