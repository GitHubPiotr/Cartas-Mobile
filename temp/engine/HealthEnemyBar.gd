extends ProgressBar

signal set_health
signal no_health

func _ready():
	Game.ADD_NODE_TO_REFERENCE_LIST(self)
	connect("set_health", self, "_set_health")
	connect("no_health", self, "_no_health")

func init():
	max_value = Game.GET_NODE_FROM_REFERENCE_LIST("Enemy").health
	value = max_value

func _set_health(value):
	self.value = value
	if self.value <= 0: emit_signal("no_health")

func _no_health():
	Game.GET_NODE_FROM_REFERENCE_LIST("Enemies").emit_signal("kill_enemy")
