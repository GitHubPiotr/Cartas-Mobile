extends Node

var units
var player
var enemy

func _init():
	Game.ADD_NODE_TO_REFERENCE_LIST(self)
	units = []

func init(player, enemy):
	self.player = player
	self.enemy = enemy

func _ready():
	units.append(player)
	units.append(enemy)
	$TickRate.start()

func _process(delta):
	if not is_instance_valid(enemy) : return
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
	if not is_instance_valid(enemy) : return
	for unit in units:
		unit.cooldown -= unit.speed
